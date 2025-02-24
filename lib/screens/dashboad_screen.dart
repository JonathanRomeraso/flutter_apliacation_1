import 'package:dark_light_button/dark_light_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/global_values.dart';
import 'package:flutter_application_1/utils/theme_settings.dart';

class DashboadScreen extends StatelessWidget {
  const DashboadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido",),
        actions: [
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
              onDoubleTap: () {
                Navigator.pushNamed(context, "/splash");
              },
              child: Icon(Icons.chevron_right)),
        )
      ])),
      //endDrawer: Drawer(),
    );
  }
}
