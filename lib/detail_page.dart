import 'package:canardpc/widget/grid_widget.dart';
import 'package:flutter/material.dart';
import 'magazine_class.dart';

class Detail extends StatefulWidget {
  final Magazine magazine;
  final VoidCallback onBack;

  const Detail({super.key, required this.magazine, required this.onBack});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late Magazine magazine;

  @override
  void initState() {
    magazine = widget.magazine;
    super.initState();
  }

  final ScrollController _scrollController = ScrollController(initialScrollOffset: 0.0);

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (v) => widget.onBack(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(controller: _scrollController, children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: magazine.id,
                    child: Image.asset(
                      magazine.image,
                      width: 300,
                      height: 400, // Adjust height as needed
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() => magazine.downloaded = !magazine.downloaded);
                      // Optional: Implement additional download or read logic
                    },
                    child: Text(magazine.downloaded ? 'Read' : 'Download'),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            MagazineGrid(
                magazines: Magazines().getByCategory(magazine.category),
                onClick: (m) => setState(() {
                      magazine = m;
                      _scrollController.animateTo(0,
                          duration: const Duration(milliseconds: 500), curve: Curves.ease);
                    }))
          ]),
        ));
  }
}
