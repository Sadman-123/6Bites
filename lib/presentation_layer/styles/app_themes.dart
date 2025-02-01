import 'package:flutter/material.dart';
class AppThemes {
  static ThemeData LightTheme(BuildContext context,double mdw,double mdh)
  {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: "inter",
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
      )
    );
  }
  static ThemeData DarkTheme(BuildContext context,double mdw,double mdh)
  {
    return ThemeData(
        brightness: Brightness.dark,
        fontFamily: "inter"
    );
  }
}