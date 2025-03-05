import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/global_values.dart';
import 'package:flutter_application_1/utils/theme_preferences.dart';
import 'package:flutter_application_1/utils/theme_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget buildFontTile(BuildContext context, String font) {
  Future<String?> _theme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? theme = prefs.getString('themeKey');
    return theme;
  }

  return ListTile(
    leading: Icon(Icons.font_download, color: Colors.blue),
    title: Text("Fuente: $font", style: TextStyle(fontFamily: font)),
    onTap: () async {
      GlobalValues.fontFamily.value = font;
      await ThemePreferences.saveFont(font);
      String? theme = await _theme();
      if (theme != null) {
        GlobalValues.themeApp.value = ThemeSettings.getThemeByName(theme);
      }
      Navigator.pop(context);
    },
  );
}

/*
Widget buildFontTile(BuildContext context, String font) {
  return ListTile(
    leading: Icon(Icons.font_download, color: Colors.blue),
    title: Text("Fuente: $font", style: TextStyle(fontFamily: font)),
    onTap: () {
      GlobalValues.updateFont(font); 
      Navigator.pop(context);
    },
  );
}
*/
