import 'package:flutter/material.dart';
import 'bottom_bar.dart';
import 'category.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  final int _currentIndex = 0;

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 40,
          child: Center (
            child: Image.asset(
              'assets/images/canard_logo.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: _currentIndex,
      ),
      body: ListView (
        children: const [
          Category(title: "Canard PC"),
          Category(title: "Hardware"),
        ],
      )
    );
  }
}

