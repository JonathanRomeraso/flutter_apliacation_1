import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/practica_dos/screens/camera_screen.dart';
import 'package:flutter_application_1/practica_dos/views/custom_snack_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

Future<File?> pickImage(BuildContext context) async {
  final selectedOption = await showModalBottomSheet<String>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text("Tomar foto"),
            onTap: () => Navigator.pop(context, "camera"),
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text("Elegir de la galería"),
            onTap: () => Navigator.pop(context, "gallery"),
          ),
        ],
      );
    },
  );

  if (selectedOption == null) return null;
  //Camara
  if (selectedOption == "camera") {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      customSnackBar(
          context, "No hay cámaras disponibles", Colors.red, Icons.error);
      return null;
    }

    final selectedCamera = await showModalBottomSheet<CameraDescription>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Selecciona la cámara",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
            ),
            ...cameras.map((camera) {
              return ListTile(
                leading: Icon(
                  camera.lensDirection == CameraLensDirection.front
                      ? Icons.camera_front
                      : Icons.camera_rear,
                  color: Colors.blueGrey,
                ),
                title: Text(
                  camera.lensDirection == CameraLensDirection.front
                      ? "Frontal"
                      : "Trasera",
                  style: const TextStyle(fontSize: 16),
                ),
                onTap: () => Navigator.pop(context, camera),
              );
            }).toList(),
          ],
        );
      },
    );

    if (selectedCamera == null) return null;

    final image = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraScreen(camera: selectedCamera),
      ),
    );

    return image != null ? File(image) : null;
  } //Galeria
  else if (selectedOption == "gallery") {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  return null;
}


// Dase de Datos Login
/*
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
*/
