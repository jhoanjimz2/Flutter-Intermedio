import 'package:flutter/material.dart';

class AppTheme {
  
  static const Color primary = Colors.indigo;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    colorScheme: const ColorScheme.dark(secondary: Colors.pink)
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primary,
    colorScheme: const ColorScheme.dark(secondary: Colors.pink)
  );

  static final ThemeData customTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(secondary: Color(0xff48A0EB)),
    primaryColorLight: Colors.white ,
    scaffoldBackgroundColor: const Color(0xff16202B),
    textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white))
  );

}
