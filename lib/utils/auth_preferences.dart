import 'package:shared_preferences/shared_preferences.dart';

class AuthPreferences {
  static const String isLoggedInKey = "isLoggedIn";

  // Guardar estado de sesión
  static Future<void> saveLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isLoggedInKey, true);
  }

  // Cargar estado de sesión
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLoggedInKey) ?? false;
  }

  // Cerrar sesión
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(isLoggedInKey);
  }
}
