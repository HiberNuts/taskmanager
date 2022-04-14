import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluish = Color(0xFF4e5ae8);
const Color yellow = Color(0xFFFFB746);
const Color pink = Color(0xFFff4667);

const primaryClr = bluish;
const Color darkGreyClr = Color(0xFF121212);
Color darkHeaderClr = const Color(0xFF424242);

class Themes {
  static final light = ThemeData(
    // colorScheme: ColorScheme.fromSwatch(
    //     primarySwatch: Colors.red, backgroundColor: Colors.white),
    // appBarTheme:
    //     AppBarTheme(backgroundColor: Colors.white, color: Colors.white),
    backgroundColor: Colors.white,

    primaryColor: Colors.white,

    brightness: Brightness.light,
    // appBarTheme: const AppBarTheme(backgroundColor: Colors.red),
  );

  static final dark = ThemeData(
    backgroundColor: darkGreyClr,
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
    // appBarTheme: const AppBarTheme(backgroundColor: Colors.yellow),
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
    ),
  );
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ),
  );
}
