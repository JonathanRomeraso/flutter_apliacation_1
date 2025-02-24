import 'package:flutter/material.dart';
import 'package:flutter_application_1/practica_figma/screens/home_screen.dart';
import 'package:flutter_application_1/practica_figma/screens/place_screen.dart';
import 'package:flutter_application_1/practica_figma/screens/splash_screen_figma.dart';
import 'package:flutter_application_1/screens/dashboad_screen.dart';
import 'package:flutter_application_1/screens/list_students_screen.dart';
import 'package:flutter_application_1/screens/splash_screen.dart';
import 'package:flutter_application_1/utils/global_values.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: GlobalValues.themeApp,
        builder: (context, value, child) {
          return MaterialApp(
            theme: value,
            routes: {
              "/list": (context) => ListStudentsScreen(),
              "/dash": (context) => DashboadScreen(),
              "/home": (context) => HomeScreen(),
              "/Place": (context) => PlaceScreen(),
              "/splash":(context) => SplashScreenFigma(),
            },
            title: 'Material App',
            home: SplashScreen(),
          );
        });
  }
}
