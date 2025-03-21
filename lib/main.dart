import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/practica_figma/screens/home_screen.dart';
import 'package:flutter_application_1/practica_figma/screens/place_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/practica_dos/screens/sign_up_screen.dart';
import 'package:flutter_application_1/practica_figma/screens/splash_screen_figma.dart';
import 'package:flutter_application_1/screens/dashboad_screen.dart';
import 'package:flutter_application_1/screens/list_students_screen.dart';
import 'package:flutter_application_1/screens/splash_screen.dart';
import 'package:flutter_application_1/screens/todo_firebase_screen.dart';
import 'package:flutter_application_1/screens/todo_screen.dart';
//import 'package:flutter_application_1/utils/auth_preferences.dart';
import 'package:flutter_application_1/utils/global_values.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GlobalValues.loadPreferences();
  //bool isLogged = await AuthPreferences.isLoggedIn();

  runApp(MyApp());
  //runApp(MyApp(isLogged: isLogged));
}

class MyApp extends StatelessWidget {
  //final bool isLogged;
  //const MyApp({super.key, required this.isLogged});
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: GlobalValues.themeApp,
      builder: (context, themeValue, child) {
        return ValueListenableBuilder<String>(
          valueListenable: GlobalValues.fontFamily,
          builder: (context, fontValue, child) {
            return MaterialApp(
              theme: themeValue.copyWith(
                textTheme: TextTheme(
                  bodyLarge: TextStyle(fontFamily: fontValue),
                  bodyMedium: TextStyle(fontFamily: fontValue),
                  titleLarge: TextStyle(fontFamily: fontValue),
                ),
              ),
              routes: {
                "/list": (context) => ListStudentsScreen(),
                "/dash": (context) => DashboadScreen(),
                "/home": (context) => HomeScreen(),
                "/Place": (context) => PlaceScreen(),
                "/splash": (context) => SplashScreenFigma(),
                "/todo": (context) => const TodoScreen(),
                "/todoFirebase": (context) => const TodoFirebaseScreen(),
                "/signUp": (context) => const SignUpScreen(),
                "/login": (context) => const LoginScreen(),
              },
              title: 'Material App',
              //home: isLogged ? const DashboadScreen() : const LoginScreen(),
              //home: const SignUpScreen(),
              //home: isLogged ? const DashboadScreen() : const LoginScreen(),
              home: SplashScreen(),
            );
          },
        );
      },
    );
  }
}
