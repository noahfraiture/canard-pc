import 'package:flutter/material.dart';
import '../classes/magazine.dart';
import '../widget/filter_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPage();
}

class _LibraryPage extends State<LibraryPage> {
  // Depend on Filter directly called in the Magazines class
  List<Magazine> magazines = Magazines().get();
  Magazine? currentMagazine;

  void _onFilterSelected() {
    // Update and rebuild the state
    setState(() {
      magazines = Magazines().get();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add padding to the body
      // TODO : move in different files / classes / widgets
      body: currentMagazine == null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: FilterButtons(notifyParent: _onFilterSelected),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300, // NOTE : dummy value
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1 / 1.41, // A4 ratio
                    ),
                    itemCount: magazines.length,
                    itemBuilder: (context, index) {
                      final magazine = magazines[index];
                      return GestureDetector(
                        onTap: () => {
                          setState(() {
                            currentMagazine = magazine;
                            Fluttertoast.showToast(msg: currentMagazine!.id);
                          }),
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage(magazine.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          : PopScope(
              canPop: false,
              onPopInvoked: (v) => {
                setState(() => currentMagazine = null),
                Fluttertoast.showToast(msg: v as String)
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: currentMagazine!.id,
                      child: Image.asset(
                        currentMagazine!.image,
                        width: 300,
                        height: 400, // Adjust height as needed
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Description',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          currentMagazine!.downloaded = !currentMagazine!.downloaded;
                        });
                        // Optional: Implement additional download or read logic
                      },
                      child: Text(currentMagazine!.downloaded ? 'Read' : 'Download'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
