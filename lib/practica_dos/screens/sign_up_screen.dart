import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/signUp/user_database.dart';
import 'package:flutter_application_1/models/signUp/user_model.dart';
import 'package:flutter_application_1/practica_dos/views/custom_snack_bar.dart';
import 'package:flutter_application_1/practica_dos/views/custom_text_field.dart';
import 'package:lottie/lottie.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _dbHelper = UserDatabase();
  File? _image;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirm = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
  /*
  Future<void> _pickImage() async {
  final pickedFile = await showDialog<XFile?>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Selecciona una fuente de imagen'),
        actions: <Widget>[
          TextButton(
            child: Text('Cámara'),
            onPressed: () async {
              final image = await ImagePicker().pickImage(source: ImageSource.camera);
              Navigator.of(context).pop(image); 
            },
          ),
          TextButton(
            child: Text('Galería'),
            onPressed: () async {
              final image = await ImagePicker().pickImage(source: ImageSource.gallery);
              Navigator.of(context).pop(image); 
            },
          ),
        ],
      );
    },
  );
  if (pickedFile != null) {
    setState(() {
      _image = File(pickedFile.path);
    });
  }
}

*/

  // Convertir imagen a bytes
  Future<Uint8List?> _convertImageToBytes(File? imageFile) async {
    if (imageFile == null) return null;
    return await imageFile.readAsBytes();
  }

  // Guardar usuario en la base de datos
  Future<void> _saveUser() async {
    if (_image == null ||
        _usernameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _passwordConfirm.text.isEmpty) {
      customSnackBar(context, "Completa todos los campos", Colors.deepOrange,
          Icons.warning);
      return;
    }

    if (_passwordController.text.compareTo(_passwordConfirm.text) != 0) {
      customSnackBar(context, "Las contraseñas no coinciden", Colors.redAccent,
          Icons.error);
      return;
    }

    Uint8List? imageBytes = await _convertImageToBytes(_image!);
    if (imageBytes == null) return;

    UserModel newUser = UserModel(
      username: _usernameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      image: imageBytes,
    );

    await _dbHelper.insertUser('users', newUser);
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
                  Positioned(
                    child: Lottie.asset("assets/tecnm.json", height: 150),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create your account",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: _pickImage,
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
                    child: Text(
                      "Sign up",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.blueGrey),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
