import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'magazine.dart';
import 'FilterButtons.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPage();
}

class _LibraryPage extends State<LibraryPage> {

  List<Magazine> children = const [
    Magazine(image: "assets/images/mai.jpg", id: "CP mai"),
    Magazine(image: "assets/images/avril.jpg", id: "SP avril"),
    Magazine(image: "assets/images/mars.jpg", id: "CP mars"),
    Magazine(image: "assets/images/fevrier.jpg", id: "HS fevrier"),
    Magazine(image: "assets/images/janvier.jpg", id: "Canard PC janvier"),
    Magazine(image: "assets/images/decembre.jpg", id: "HW decembre"),
    Magazine(image: "assets/images/novembre.jpg", id: "novembre"),
  ];

  Set<String> _selectedFilters = {'All'};
  void _onFilterSelected(Set<String> filter) {
    setState(() {
      _selectedFilters = filter;
    });
  }

  List<Magazine> get _filteredItems {
    if (_selectedFilters.contains('All')) {
      return children;
    } else {
      return children.where((item) => _selectedFilters.any((filter) => item.id.contains(filter))).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    var i = 0;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: FilterButtons(onFiltersSelected: _onFilterSelected),
        ),
        for (var i = 0; i < _filteredItems.length; i += 2)
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left column
                  GestureDetector(
                    onTap: () {
                      Fluttertoast.showToast(
                        msg: "id : ${_filteredItems[i].id}",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    },
                    child: Image.asset(
                      _filteredItems[i].image,
                      scale: 2.2,
                    ),
                  ),
                  // Right column
                  if (i + 1 < _filteredItems.length)
                    GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(
                          msg: "id : ${_filteredItems[i + 1].id}",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                      child: Image.asset(
                        _filteredItems[i + 1].image,
                        scale: 2.2,
                      ),
                    ),
                ],
              ))
      ],
    );
  }
}
