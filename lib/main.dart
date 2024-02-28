import 'package:canardpc/firebase_options.dart';
import 'package:canardpc/color_theme.dart';
import 'package:canardpc/pages/profile_in_page.dart';
import 'package:canardpc/pages/profile_out_page.dart';
import 'package:canardpc/pages/shop_page.dart';
import 'package:canardpc/pages/library_page.dart';
import 'package:canardpc/widget/canard_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'classes/magazine.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final _bottomItems = const [
    BottomNavigationBarItem(
        activeIcon: Icon(Icons.home), icon: Icon(Icons.home_outlined), label: 'Accueil'),
    BottomNavigationBarItem(
        activeIcon: Icon(Icons.bookmark), icon: Icon(Icons.bookmark_border), label: 'Bibliothèque'),
    BottomNavigationBarItem(
        activeIcon: Icon(Icons.person), icon: Icon(Icons.person_outline), label: 'Profil'),
  ];

  final _pages = [
    const ShopPage(),
    const LibraryPage(),
    FirebaseAuth.instance.currentUser == null ? const ProfileOutPage() : const ProfileInPage(),
  ];

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _pages[2] = user == null ? const ProfileOutPage() : const ProfileInPage();
      });
    });
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
