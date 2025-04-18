import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/theme_preferences.dart';
import 'package:flutter_application_1/utils/theme_settings.dart';

class GlobalValues {
  static ValueNotifier isValidating = ValueNotifier(false);
  //static ValueNotifier themeApp = ValueNotifier(ThemeData.light());
  //static ValueNotifier<String> fontFamily = ValueNotifier("Poopins");

  static ValueNotifier themeApp = ValueNotifier(ThemeSettings.purpleDarkTheme());
  static ValueNotifier<String> fontFamily = ValueNotifier("Poppins");
  static ValueNotifier updList = ValueNotifier(false);

  static Future<void> loadPreferences() async {
    String? savedTheme = await ThemePreferences.getSavedTheme();
    String? savedFont = await ThemePreferences.getSavedFont();

    if (savedTheme != null) {
      themeApp.value = ThemeSettings.getThemeByName(savedTheme);
    }
    if (savedFont != null) {
      fontFamily.value = savedFont;
    }
  }
}
