import 'package:flutter/material.dart';
import 'filter.dart';
import 'magazine.dart';
import 'filter_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPage();
}

class _LibraryPage extends State<LibraryPage> {
  late List<Magazine> magazines;
  void _onFilterSelected() {
    // update and rebuild the state
    setState(() {});
    magazines = Magazines().get(Filter().getMap());
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: FilterButtons(notifyParent: _onFilterSelected),
        ),
        // filtered items 2xn
        for (int i = 0; i < magazines.length; i += 2)
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                // Left column
                GestureDetector(
                    onTap: () => Fluttertoast.showToast(msg: magazines[i].id),
                    child: Image.asset(magazines[i].image, scale: 2.2)),
                // Right column
                if (i + 1 < magazines.length)
                  GestureDetector(
                    onTap: () => Fluttertoast.showToast(msg: magazines[i + 1].id),
                    child: Image.asset(magazines[i + 1].image, scale: 2.2),
                  )
              ]))
      ],
    );
  }
}
