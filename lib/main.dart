import 'dart:developer';
import 'dart:io';

import 'package:canardpc/firebase_options.dart';
import 'package:canardpc/resources/color_theme.dart';
import 'package:canardpc/profile/profile_in.dart';
import 'package:canardpc/profile/profile_out.dart';
import 'package:canardpc/home/home.dart';
import 'package:canardpc/library/library.dart';
import 'package:canardpc/widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'magazine.dart';
import 'main_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final _bottomItems = const [
    BottomNavigationBarItem(
        activeIcon: Icon(Icons.home), icon: Icon(Icons.home_outlined), label: 'Home'),
    BottomNavigationBarItem(
        activeIcon: Icon(Icons.bookmark), icon: Icon(Icons.bookmark_border), label: 'Library'),
    BottomNavigationBarItem(
        activeIcon: Icon(Icons.person), icon: Icon(Icons.person_outline), label: 'Profile'),
  ];

  final _pages = [
    const Home(),
    const LibraryPage(),
    FirebaseAuth.instance.currentUser == null ? const ProfileOutPage() : const ProfileInPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: canardBar(context),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomItems,
        currentIndex: _currentIndex,
        onTap: (int index) => setState(() => _currentIndex = index),
        selectedItemColor: Theme.of(context).colorScheme.onSurface,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}
