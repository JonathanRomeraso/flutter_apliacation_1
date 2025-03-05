import 'package:flutter/material.dart';
import 'global_values.dart';

class ThemeSettings {
  static ThemeData lightTheme() {
    final theme = ThemeData.light().copyWith(
        textTheme: _getTextTheme(),
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Colors.red,
            onPrimary: Colors.amber,
            secondary: Colors.amber,
            onSecondary: Colors.amber,
            error: Colors.amber,
            onError: Colors.amber,
            surface: Colors.black,
            onSurface: Colors.amber));
    return theme;
  }

  static ThemeData darkTheme() {
    final theme = ThemeData.dark().copyWith(
        textTheme: _getTextTheme(),
        colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: Colors.grey,
            onPrimary: Colors.amber,
            secondary: Colors.amber,
            onSecondary: Colors.amber,
            error: Colors.amber,
            onError: Colors.amber,
            surface: Colors.black,
            onSurface: Colors.amber));
    return theme;
  }

  static ThemeData blueTheme() {
    return ThemeData(
      textTheme: _getTextTheme(),
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.blue[50],
      appBarTheme: AppBarTheme(backgroundColor: Colors.blue[700]),
      colorScheme: ColorScheme.light(
        primary: Colors.blue,
        onPrimary: Colors.white,
        secondary: Colors.blueAccent,
        onSecondary: Colors.white,
      ),
    );
  }

  static ThemeData greenTheme() {
    return ThemeData(
      textTheme: _getTextTheme(),
      brightness: Brightness.light,
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.green[50],
      appBarTheme: AppBarTheme(backgroundColor: Colors.green[700]),
      colorScheme: ColorScheme.light(
        primary: Colors.green,
        onPrimary: Colors.white,
        secondary: Colors.greenAccent,
        onSecondary: Colors.white,
      ),
    );
  }

  static ThemeData purpleDarkTheme() {
    return ThemeData.dark().copyWith(
      textTheme: _getTextTheme(),
      colorScheme: ColorScheme.dark(
          brightness: Brightness.dark,
          primary: Colors.deepPurple,
          onPrimary: Colors.white,
          secondary: Colors.purpleAccent,
          onSecondary: Colors.white,
          surface: Colors.black,
          onSurface: Colors.white),
      //scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(backgroundColor: Colors.deepPurple[800]),
    );
  }

  static ThemeData getThemeByName(String themeName) {
    switch (themeName) {
      case "dark":
        return darkTheme();
      case "blue":
        return blueTheme();
      case "green":
        return greenTheme();
      case "purple":
        return purpleDarkTheme();
      case "cLight":
        return ThemeData.light();
      case "cDark":
        return ThemeData.dark();
      default:
        return lightTheme();
    }
  }

  static TextTheme _getTextTheme() {
    return TextTheme(
      bodyLarge: TextStyle(fontFamily: GlobalValues.fontFamily.value),
      bodyMedium: TextStyle(fontFamily: GlobalValues.fontFamily.value),
      titleLarge: TextStyle(fontFamily: GlobalValues.fontFamily.value),
    );
  }
}
