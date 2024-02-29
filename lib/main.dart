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
  MainPages _page = Home();
  final _bottomItems = const [
    BottomNavigationBarItem(
        activeIcon: Icon(Icons.home), icon: Icon(Icons.home_outlined), label: 'Home'),
    BottomNavigationBarItem(
        activeIcon: Icon(Icons.bookmark), icon: Icon(Icons.bookmark_border), label: 'Library'),
    BottomNavigationBarItem(
        activeIcon: Icon(Icons.person), icon: Icon(Icons.person_outline), label: 'Profile'),
  ];

  @override
  void initState() {
    Home();
    LibraryPage();
    const ProfileOutPage();
    const ProfileInPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: canardBar(context),
      body: _page as Widget,
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomItems,
        currentIndex: _currentIndex,
        onTap: (int index) => setState(() {
          _currentIndex = index;
          switch (_currentIndex) {
            case 0:
              _page = Home();
            case 1:
              _page = LibraryPage();
            case 2:
              FirebaseAuth.instance.currentUser == null
                  ? const ProfileOutPage()
                  : const ProfileInPage();
          }
          _page.reload();
        }),
        selectedItemColor: Theme.of(context).colorScheme.onSurface,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}
