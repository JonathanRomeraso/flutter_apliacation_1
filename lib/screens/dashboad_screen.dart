//import 'package:dark_light_button/dark_light_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/practica_dos/views/build_font_tile.dart';
import 'package:flutter_application_1/practica_dos/views/build_theme_tile.dart';
import 'package:flutter_application_1/utils/auth_preferences.dart';
//import 'package:flutter_application_1/utils/global_values.dart';
import 'package:flutter_application_1/utils/theme_settings.dart';

class DashboadScreen extends StatefulWidget {
  const DashboadScreen({super.key});

  @override
  State<DashboadScreen> createState() => _DashboadScreenState();
}

class _DashboadScreenState extends State<DashboadScreen> {
  bool _isSessionActive = false;
  @override
  void initState() {
    super.initState();
    _loadSessionState();
  }

  Future<void> _loadSessionState() async {
    bool isLoggedIn = await AuthPreferences.isLoggedIn();
    setState(() {
      _isSessionActive = isLoggedIn;
    });
  }

  // Guardar estado en SharedPreferences
  Future<void> _toggleSession(bool value) async {
    if (value) {
      await AuthPreferences.saveLogin();
    } else {
      await AuthPreferences.logout();
    }
    setState(() {
      _isSessionActive = value;
    });
  }

  Future<void> _logout() async {
    await AuthPreferences.logout();
    setState(() {
      _isSessionActive = false;
    });
    Navigator.pushReplacementNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bienvenido",
        ),
        actions: [
          /*
          DarlightButton(
              type: Darlights.DarlightFour,
              options: DarlightFourOption(),
              onChange: (value) {
                if (value == ThemeMode.light) {
                  GlobalValues.themeApp.value = ThemeSettings.lightTheme();
                } else {
                  GlobalValues.themeApp.value = ThemeSettings.darkTheme();
                }
              }),
              */
        ],
      ),
      drawer: Drawer(
          child: ListView(children: [
        UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("https://i.pravatar.cc/207"),
            ),
            accountName: Text('Jonathan Rodriguez Romero'),
            accountEmail: Text("21030021@itcelaya.edu.mx")),
        ListTile(
          leading: Icon(Icons.design_services),
          title: Text("Practica Figma"),
          subtitle: Text("Fronted App"),
          trailing: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/splash");
              },
              child: Icon(Icons.chevron_right)),
        ),
        ListTile(
          onTap: () => Navigator.pushNamed(context, "/todo"),
          leading: Icon(Icons.task),
          title: Text("Todo App"),
          subtitle: Text("Task List"),
          trailing: Icon(Icons.chevron_right),
        ),
        const Divider(),
        SwitchListTile(
          value: _isSessionActive,
          title: const Text("Mantener iniciada la sesion"),
          onChanged: (value) => _toggleSession(value),
        ),
        ListTile(
          leading: const Icon(Icons.exit_to_app, color: Colors.red),
          title:
              const Text("Cerrar sesión", style: TextStyle(color: Colors.red)),
          onTap: () async {
            await _logout();
          },
        ),
      ])),
      endDrawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: Center(
                child: Text(
                  "Selecciona un tema",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            buildThemeTile(
              context,
              icon: Icons.light_mode,
              text: "Modo Claro",
              themeKey: "light",
              theme: ThemeSettings.lightTheme(),
            ),
            buildThemeTile(
              context,
              icon: Icons.dark_mode,
              text: "Modo Oscuro",
              themeKey: "dark",
              theme: ThemeSettings.darkTheme(),
            ),
            buildThemeTile(
              context,
              icon: Icons.water,
              text: "Tema Azul",
              themeKey: "blue",
              theme: ThemeSettings.blueTheme(),
            ),
            buildThemeTile(
              context,
              icon: Icons.eco,
              text: "Tema Verde",
              themeKey: "green",
              theme: ThemeSettings.greenTheme(),
            ),
            buildThemeTile(
              context,
              icon: Icons.nightlight_round,
              text: "Tema Púrpura Oscuro",
              themeKey: "purple",
              theme: ThemeSettings.purpleDarkTheme(),
            ),
            buildThemeTile(
              context,
              icon: Icons.light_mode,
              text: "Classic Claro",
              themeKey: "cLight",
              theme: ThemeData.light(),
            ),
            buildThemeTile(
              context,
              icon: Icons.dark_mode,
              text: "Classic Dark",
              themeKey: "cDark",
              theme: ThemeData.dark(),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Selecciona una fuente",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            buildFontTile(context, "Poppins"),
            buildFontTile(context, "Swar"),
            buildFontTile(context, "Montserrat"),
          ],
        ),
      ),
    );
  }
}
