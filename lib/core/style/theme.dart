import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.white,
      elevation: 0.0,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.w900,
      ),
    ),
    textTheme: getTextTheme(),
  );

  static TextTheme getTextTheme() {
    return TextTheme(
      displayLarge: GoogleFonts.balooThambi2(
        fontSize: 30,
        height: 0.9,
        fontWeight: FontWeight.w500,
        color: AppColor.gray02,
      ),
      headlineSmall: const TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: AppColor.white,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: Colors.grey.shade400,
        fontSize: 13.0,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: const TextStyle(
        fontSize: 14.0,
        fontFamily: 'Hind',
      ),
    );
  }
}
