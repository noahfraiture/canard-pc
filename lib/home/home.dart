import 'dart:developer';

import 'package:canardpc/home/seemore_page.dart';
import 'package:flutter/material.dart';
import '../magazine.dart';
import '../library/detail_page.dart';
import '../main_pages.dart';
import 'discover.dart';

class Home extends StatefulWidget implements MainPages {
  Home({super.key});

  late MainPages? delegate;

  @override
  void reload() {
    delegate?.reload();
  }

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> implements MainPages {
  Category? currentCategory;
  Magazine? currentMagazine;

  @override
  void initState() {
    widget.delegate = this;
    currentCategory = null;
    currentMagazine = null;
    super.initState();
  }

  @override
  void reload() {
    setState(() {
      currentMagazine = null;
      currentCategory = null;
    });
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
