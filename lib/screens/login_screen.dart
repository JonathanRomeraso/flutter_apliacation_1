import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase/auth_firebase.dart';
import 'package:flutter_application_1/practica_dos/views/custom_snack_bar.dart';
import 'package:flutter_application_1/utils/global_values.dart';
import 'package:lottie/lottie.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthFirebase? authFirebase;

  Future<void> _login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      customSnackBar(context, "Por favor, llena todos los campos",
          Colors.deepOrange, Icons.warning);
      return;
    }

    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //String? storedEmail = prefs.getString('email');
    //String? storedPassword = prefs.getString('password');

    GlobalValues.isValidating.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      GlobalValues.isValidating.value = false;

      authFirebase?.loginUser(email, password).then(
        (result) {
          if (result == "success") {
            Navigator.pushNamed(context, "/dash");
          } else if (result == "email_not_verified") {
            customSnackBar(
              context,
              "Debes verificar tu correo antes de iniciar sesión",
              Colors.orange,
              Icons.warning,
            );
          } else {
            customSnackBar(
              context,
              "Usuario o contraseña incorrectos",
              Colors.redAccent,
              Icons.error,
            );
          }
        },
      );
      /*
      if (storedEmail == email && storedPassword == password) {
        Navigator.pushNamed(context, "/dash");
      } else {
        customSnackBar(context, "Usuario o contraseña incorrectos",
            Colors.redAccent, Icons.error);
      }
      */
    });
  }

  @override
  initState() {
    super.initState();
    authFirebase = AuthFirebase();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
        opacity: 0.3,
        fit: BoxFit.cover,
        image: AssetImage("assets/fondo.jpg"),
      )),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 500,
              child: ValueListenableBuilder(
                  valueListenable: GlobalValues.isValidating,
                  builder: (context, value, child) {
                    return value ? CircularProgressIndicator() : Container();
                  })),
          Positioned(
            top: 270,
            left: 2,
            child: Lottie.asset("assets/tecnm.json", height: 250),
          ),
          Positioned(
            bottom: 50,
            child: Container(
              padding: EdgeInsets.all(10),
              height: 250,
              width: MediaQuery.of(context).size.width * .9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Introduce tu Correo",
                      hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.blueAccent.withValues(alpha: 0.1),
                      filled: true,
                      prefixIcon: Icon(Icons.email, color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Introduce la contraseña",
                      hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.blueAccent.withValues(alpha: 0.1),
                      filled: true,
                      prefixIcon: Icon(Icons.lock, color: Colors.black),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      _login();
                    },
                    child: Image.asset(
                      "assets/buttonSignUp.png",
                      height: 60,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Dont have an account? ",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/signUp");
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.blueGrey),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
