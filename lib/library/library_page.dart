import 'dart:developer';

import 'package:canardpc/library/owned_page.dart';
import 'package:canardpc/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:canardpc/magazine_class.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key, required this.stream});

  final Stream<void> stream;

  @override
  State<LibraryPage> createState() => _LibraryPage();
}

class _LibraryPage extends State<LibraryPage> {
  // Depend on Filter directly called in the Magazines class
  Magazine? currentMagazine;

  @override
  void initState() {
    widget.stream.listen((event) {
      // index in the main list to avoid rebuilding if we aren't on this page.
      setState(() {
        currentMagazine = null;
      });
    });
    currentMagazine = null;
    super.initState();
  }

  @override
  void dispose() {
    log("dispose library");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentMagazine == null
          ? Owned(onClick: (magazine) {
              setState(() {
                currentMagazine = magazine;
              });
            })
          : Detail(
              magazine: currentMagazine!,
              onBack: () {
                setState(() {
                  currentMagazine = null;
                });
              }),
    );
  }
}
