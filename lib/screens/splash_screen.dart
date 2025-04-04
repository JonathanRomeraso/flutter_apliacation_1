import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/dashboad_screen.dart';
//import 'package:flutter_application_1/screens/list_students_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/utils/auth_preferences.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 6), () async {
      bool isLogged = await AuthPreferences.isLoggedIn();
      if (isLogged) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboadScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });

    return Scaffold(
      body: FlutterSplashScreen(
        //duration: Duration(milliseconds: 6000),
        //nextScreen: LoginScreen(),
        backgroundColor: Colors.white,
        splashScreenBody: Center(
          child: Lottie.asset("assets/tecnm.json"),
        ),
      ),
    );
  }
}
