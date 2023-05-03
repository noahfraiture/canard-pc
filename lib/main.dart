import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'color_theme.dart';
import 'custom_color.dart';
import 'shop_page.dart';
import 'library_page.dart';
import 'logout_page.dart';
import 'sign_in_page.dart';
import 'loggedin_page.dart';
import 'logout_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightScheme;
        ColorScheme darkScheme;

        if (lightDynamic != null && darkDynamic != null) {
          lightScheme = lightDynamic.harmonized();
          lightCustomColors = lightCustomColors.harmonized(lightScheme);

          // Repeat for the dark color scheme.
          darkScheme = darkDynamic.harmonized();
          darkCustomColors = darkCustomColors.harmonized(darkScheme);
        } else {
          // Otherwise, use fallback schemes.
          lightScheme = lightColorScheme;
          darkScheme = darkColorScheme;
        }

        return MaterialApp(
          navigatorKey: navigatorKey,
          scrollBehavior: const MyScrollBehavior(),
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightScheme,
            extensions: [lightCustomColors],
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkScheme,
            extensions: [darkCustomColors],
          ),
          themeMode: ThemeMode.light,
          home: const Main(),
        );
      },
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;

  final _children = const [
    ShopPage(),
    LibraryPage(),
    LogoutPage(),
    SignInPage(),
  ];
  final _bottomItems = const [
    BottomNavigationBarItem(activeIcon: Icon(Icons.home), icon: Icon(Icons.home_outlined), label: 'Accueil'),
    BottomNavigationBarItem(activeIcon: Icon(Icons.bookmark), icon: Icon(Icons.bookmark_border), label: 'Bibliothèque'),
    BottomNavigationBarItem(activeIcon: Icon(Icons.person), icon: Icon(Icons.person_outline), label: 'Profil'),
    BottomNavigationBarItem(activeIcon: Icon(Icons.login), icon: Icon(Icons.login_outlined), label: 'Connexion'),
  ];

  final _loggedInPage = const LoggedInPage();
  final _logoutPage = const LogoutPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex != 2
          ? IndexedStack(
              index: _currentIndex,
              children: _children,
            )
          : StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _loggedInPage;
          } else {
            return _logoutPage;
          }
        },
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: SizedBox(
          height: 40,
          child: Center(
            child: Image.asset(
              'assets/images/canard_logo.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) => setState(() => _currentIndex = index),
        items: _bottomItems,
        selectedItemColor: Theme.of(context).colorScheme.onSurface,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}

class MyScrollBehavior extends ScrollBehavior {
  const MyScrollBehavior();

  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return GlowingOverscrollIndicator(
      axisDirection: details.direction,
      color: Theme.of(context).splashColor, // Set the color to the accent color of the theme
      child: child,
    );
  }
}
