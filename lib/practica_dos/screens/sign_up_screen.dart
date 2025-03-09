import 'package:flutter/material.dart';
import 'package:flutter_application_1/practica_dos/views/pick_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/practica_dos/views/custom_snack_bar.dart';
import 'package:flutter_application_1/practica_dos/views/custom_text_field.dart';
import 'package:lottie/lottie.dart';
import 'dart:io';
import 'dart:convert';
import 'package:email_validator/email_validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  File? _image;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirm = TextEditingController();

  Future<String?> _convertImageToBase64(File? imageFile) async {
    if (imageFile == null) return null;
    List<int> imageBytes = await imageFile.readAsBytes();
    return base64Encode(imageBytes);
  }

  Future<void> _saveUser() async {
    if (_image == null) {
      customSnackBar(
          context, "Agrega una imagen", Colors.deepOrange, Icons.warning);
      return;
    }
    if (_image == null ||
        _usernameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _passwordConfirm.text.isEmpty) {
      customSnackBar(context, "Completa todos los campos", Colors.deepOrange,
          Icons.warning);
      return;
    }

    if (!EmailValidator.validate(_emailController.text)) {
      customSnackBar(
          context, "El Email no es valido", Colors.redAccent, Icons.warning);
      return;
    }
    if (_passwordController.text != _passwordConfirm.text) {
      customSnackBar(context, "Las contraseñas no coinciden", Colors.redAccent,
          Icons.error);
      return;
    }

    String? imageBase64 = await _convertImageToBase64(_image);
    if (imageBase64 == null) return;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _usernameController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('password', _passwordController.text);
    await prefs.setString('image', imageBase64);

    customSnackBar(
        context, "Usuario registrado", Colors.lightGreen, Icons.check);

    _usernameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _passwordConfirm.clear();
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Lottie.asset("assets/tecnm.json", height: 150),
                  const SizedBox(height: 20.0),
                  const Text("Sign up",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Text("Create your account",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () async {
                      final selectedImage = await pickImage(context);
                      if (selectedImage != null) {
                        setState(() {
                          _image = selectedImage;
                        });
                      }
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      backgroundImage:
                          _image != null ? FileImage(_image!) : null,
                      child: _image == null
                          ? const Icon(Icons.camera_alt,
                              size: 40, color: Colors.white)
                          : null,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  customTextFiel("Username", Icons.person, _usernameController),
                  const SizedBox(height: 20),
                  customTextFiel("Email", Icons.email, _emailController),
                  const SizedBox(height: 20),
                  customTextFiel("Password", Icons.lock, _passwordController,
                      obscureText: true),
                  const SizedBox(height: 20),
                  customTextFiel(
                      "Confirm Password", Icons.lock, _passwordConfirm,
                      obscureText: true),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 3, left: 3),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: _saveUser,
                  child: const Text("Sign up",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  TextButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      Navigator.pushNamed(context, "/login");
                    },
                    child: const Text("Login",
                        style: TextStyle(color: Colors.blueGrey)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

