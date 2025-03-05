import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/global_values.dart';

Widget buildThemeTile(BuildContext context,
    {required IconData icon, required String text, required ThemeData theme}) {
  return ListTile(
    leading: Icon(icon, color: Colors.amber),
    title: Text(text),
    onTap: () {
      GlobalValues.themeApp.value = theme;
      Navigator.pop(context);
    },
  );
}
