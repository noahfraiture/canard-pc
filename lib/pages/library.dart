import 'dart:developer';
import 'package:canardpc/widget/downloads.dart';
import 'package:canardpc/widget/magazine_detail.dart';
import 'package:flutter/material.dart';
import 'package:canardpc/classes/magazine.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      // Add padding to the body
      // TODO : move in different files / classes / widgets
      body: currentMagazine == null
          ? Downloads(onClick: (magazine) {
              setState(() {
                currentMagazine = magazine;
              });
            })
          : MagazineDetail(
              magazine: currentMagazine!,
              onBack: () {
                log("Back1");
                setState(() {
                  log("Back2");
                  currentMagazine = null;
                  log("Back3");
                });
              }),
    );
  }
}
