import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const String themeKey = "selectedTheme";
  static const String fontKey = "selectedFont";

  // Guardar el tema seleccionado
  static Future<void> saveTheme(String themeName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(themeKey, themeName);
  }

  // Obtener el tema guardado
  static Future<String?> getSavedTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(themeKey);
  }

  // Guardar la fuente seleccionada
  static Future<void> saveFont(String fontName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(fontKey, fontName);
  }

  // Obtener la fuente guardada
  static Future<String?> getSavedFont() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(fontKey);
  }
}
