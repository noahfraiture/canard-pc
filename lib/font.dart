import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getPrimaryTextStyle(BuildContext context) {
  return TextStyle(
    fontFamily: GoogleFonts.anybody().fontFamily,
    fontSize: 20.0,
    color: Theme.of(context).colorScheme.onBackground,
  );
}

TextStyle smallButtonTextStyle(BuildContext context) {
  return TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 12.0,
    color: Theme.of(context).colorScheme.onPrimary,
  );
}

TextStyle mediumButtonTextStyle(BuildContext context) {
  return TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 14.0,
    color: Theme.of(context).colorScheme.onPrimary,
  );
}

TextStyle getTertiaryTextStyle(BuildContext context) {
  return TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 14.0,
    color: Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle getLinkTextStyle(BuildContext context) {
  return TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 14.0,
    color: Theme.of(context).colorScheme.primary,
    decoration: TextDecoration.underline,
  );
}