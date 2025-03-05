import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/global_values.dart';
import 'package:flutter_application_1/utils/theme_settings.dart';

Widget buildFontTile(BuildContext context, String font) {
  return ListTile(
    leading: Icon(Icons.font_download, color: Colors.blue),
    title: Text("Fuente: $font", style: TextStyle(fontFamily: font)),
    onTap: () {
      GlobalValues.fontFamily.value = font;
      GlobalValues.themeApp.value = ThemeSettings.lightTheme(); 
      Navigator.pop(context);
    },
  );
}