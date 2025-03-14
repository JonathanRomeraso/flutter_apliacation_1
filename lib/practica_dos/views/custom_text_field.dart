import 'package:flutter/material.dart';

Widget customTextFiel(
    String hintText, IconData icon, TextEditingController controller,
    {bool obscureText = false}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      //fillColor: Colors.blueAccent.withValues(alpha: 0.1),
      filled: true,
      prefixIcon: Icon(icon),
    ),
    obscureText: obscureText,
    style: TextStyle(color: Colors.blueGrey),
  );
}
