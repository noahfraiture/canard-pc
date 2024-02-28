import 'package:flutter/material.dart';

AppBar canardBar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.primary,
    title: SizedBox(
      height: 40,
      child: Center(
        child: Image.asset(
          'assets/images/canard_logo.png', // TODO : add image
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}
