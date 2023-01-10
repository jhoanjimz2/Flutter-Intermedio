import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff201E28);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
  );
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: primary ,
    // scaffoldBackgroundColor: Color(0xff40404C),
    iconTheme: IconThemeData(
      color: Colors.white.withOpacity(0.4)
    )
  );
}
