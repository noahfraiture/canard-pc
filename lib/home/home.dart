import 'dart:developer';
import 'package:canardpc/home/seemore_page.dart';
import 'package:flutter/material.dart';
import '../magazine.dart';
import '../detail_page.dart';
import 'discover.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Category? currentCategory;
  Magazine? currentMagazine;

  @override
  void initState() {
    currentCategory = null;
    currentMagazine = null;
    super.initState();
  }

  @override
  void dispose() {
    log("dispose home");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (currentCategory == null && currentMagazine == null) {
      body = Discover(
        onClickMagazine: (magazine) {
          setState(() {
            currentMagazine = magazine;
          });
        },
        onClickCategory: (category) {
          setState(() {
            currentCategory = category;
          });
        },
      );
    } else if (currentMagazine != null) {
      body = Detail(
          magazine: currentMagazine!,
          onBack: () {
            setState(() {
              currentMagazine = null;
            });
          });
    } else {
      // category != null
      body = SeeMore(
          category: currentCategory!,
          onBack: () {
            setState(() {
              currentCategory = null;
            });
          },
          onClick: (magazine) {
            setState(() {
              currentMagazine = magazine;
            });
          });
    }
    return Scaffold(body: body);
  }
}
