import 'dart:developer';

import 'package:canardpc/library/owned_page.dart';
import 'package:canardpc/library/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:canardpc/magazine.dart';

import '../main_pages.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPage();
}

class _LibraryPage extends State<LibraryPage> {
  // Depend on Filter directly called in the Magazines class
  Magazine? currentMagazine;

  @override
  void initState() {
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
