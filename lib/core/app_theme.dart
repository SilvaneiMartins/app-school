import "package:flutter/material.dart";

class AppTheme {
  static ThemeData darkThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: Colors.white
        ),
        bodyLarge: TextStyle(
          color: Colors.red,
        )
      ),
      appBarTheme: AppBarThemeData(
        backgroundColor: Colors.black
      ),
    );
  }

  static ThemeData lightThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarThemeData(
        backgroundColor: Colors.white
      ),
    );
  }
}
