import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/global_values.dart';
import 'package:flutter_application_1/utils/theme_preferences.dart';

Widget buildThemeTile(BuildContext context, {required IconData icon, required String text, required String themeKey, required ThemeData theme}) {
  return ListTile(
    leading: Icon(icon, color: Colors.amber),
    title: Text(text),
    onTap: () async {
      GlobalValues.themeApp.value = theme;
      await ThemePreferences.saveTheme(themeKey); 
      Navigator.pop(context);
    },
  );
}