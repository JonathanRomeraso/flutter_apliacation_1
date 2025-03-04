import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/signUp/user_database.dart';
import 'package:flutter_application_1/practica_dos/views/custom_snack_bar.dart';
import 'package:flutter_application_1/utils/global_values.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _dbHelper = UserDatabase();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      customSnackBar(context, "Por favor, llena todos los campos",
          Colors.deepOrange, Icons.warning);
      return;
    }

    GlobalValues.isValidating.value = true;
    final user = await _dbHelper.getUser('users', email, password);
    Future.delayed(const Duration(seconds: 2), () {
      GlobalValues.isValidating.value = false;
      if (user != null) {
        Navigator.pushNamed(context, "/dash");
      } else {
        customSnackBar(context, "Usuario o contraseña incorrectos",
            Colors.redAccent, Icons.error);
      }
    });
  }

  @override
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
                    GlobalValues.isValidating.value = false;
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
                color: const Color.fromARGB(255, 245, 248, 254),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Introduce el usuario",
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Introduce la contraseña",
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
                      const Text("Dont have an account? "),
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
