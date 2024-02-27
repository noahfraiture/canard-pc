import 'dart:ui';

import 'package:flutter/material.dart';

const lightTextColor = Color(0xFF100f0f);
const lightBackgroundColor = Color(0xFFffffff);
const lightPrimaryColor = Color(0xFFed1d27);
const lightPrimaryFgColor = Color(0xFF100f0f);
const lightSecondaryColor = Color(0xFFf0f0f0);
const lightSecondaryFgColor = Color(0xFF100f0f);
const lightAccentColor = Color(0xFF58a3f3);
const lightAccentFgColor = Color(0xFF100f0f);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  background: lightBackgroundColor,
  onBackground: lightTextColor,
  primary: lightPrimaryColor,
  onPrimary: lightPrimaryFgColor,
  secondary: lightSecondaryColor,
  onSecondary: lightSecondaryFgColor,
  tertiary: lightAccentColor,
  onTertiary: lightAccentFgColor,
  surface: lightBackgroundColor,
  onSurface: lightTextColor,
  error: Brightness.light == Brightness.light ? Color(0xffB3261E) : Color(0xffF2B8B5),
  onError: Brightness.light == Brightness.light ? Color(0xffFFFFFF) : Color(0xff601410),
);

const darkTextColor = Color(0xFFf0efef);
const darkBackgroundColor = Color(0xFF000000);
const darkPrimaryColor = Color(0xFFe73d46);
const darkPrimaryFgColor = Color(0xFF000000);
const darkSecondaryColor = Color(0xFF0f0f0f);
const darkSecondaryFgColor = Color(0xFFf0efef);
const darkAccentColor = Color(0xFF0c57a7);
const darkAccentFgColor = Color(0xFFf0efef);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  background: darkBackgroundColor,
  onBackground: darkTextColor,
  primary: darkPrimaryColor,
  onPrimary: darkPrimaryFgColor,
  secondary: darkSecondaryColor,
  onSecondary: darkSecondaryFgColor,
  tertiary: darkAccentColor,
  onTertiary: darkAccentFgColor,
  surface: darkBackgroundColor,
  onSurface: darkTextColor,
  error: Brightness.dark == Brightness.light ? Color(0xffB3261E) : Color(0xffF2B8B5),
  onError: Brightness.dark == Brightness.light ? Color(0xffFFFFFF) : Color(0xff601410),
);
