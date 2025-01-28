import 'package:flutter/material.dart';
class AppThemes {
  static ThemeData LightTheme(BuildContext context,double mdw,double mdh)
  {
    return ThemeData(
      brightness: Brightness.light
    );
  }
  static ThemeData DarkTheme(BuildContext context,double mdw,double mdh)
  {
    return ThemeData(
        brightness: Brightness.dark
    );
  }
}