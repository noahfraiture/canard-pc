import 'package:canardpc/widget/grid_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'magazine.dart';

class Detail extends StatefulWidget {
  final Magazine magazine;
  final VoidCallback onBack;

  const Detail({super.key, required this.magazine, required this.onBack});

  @override
  DetailState createState() => DetailState();
}

class DetailState extends State<Detail> {
  late Magazine magazine;

  @override
  void initState() {
    magazine = widget.magazine;
    super.initState();
  }

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (v) => widget.onBack(),
        child: ListView(children: [
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
                      magazine.downloaded = !magazine.downloaded;
                    });
                    // Optional: Implement additional download or read logic
                  },
                  child: Text(magazine.downloaded ? 'Read' : 'Download'),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: MagazineGrid(
                  magazines: Magazines().getByCategory(magazine.category),
                  onClick: (m) => setState(() => magazine = m)))
        ]));
  }
}
