import 'package:flutter/material.dart';

const Color bluish = Color(0xFF4e5ae8);
const Color yellow = Color(0xFFFFB746);
const Color pink = Color(0xFFff4667);
const primaryClr = bluish;
const Color darkGreyClr = Color(0xFF121212);
Color darkHeaderClr =const Color(0xFF424242);

class Themes {
  static final light = ThemeData(
    primaryColor: primaryClr,
    brightness: Brightness.light,
    // appBarTheme: const AppBarTheme(backgroundColor: Colors.red),
  );

  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
    // appBarTheme: const AppBarTheme(backgroundColor: Colors.yellow),
  );
}
