import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/global_values.dart';
import 'package:intl/intl.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter_application_1/database/task_database.dart';
import 'package:flutter_application_1/models/todo_model.dart';

class TodoFirebaseScreen extends StatefulWidget {
  const TodoFirebaseScreen({super.key});

  @override
  State<TodoFirebaseScreen> createState() => _TodoFirebaseScreenState();
}

class _TodoFirebaseScreenState extends State<TodoFirebaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tareas"),
      ),
      /*
      body: StreamBuilder(
        //stream: stream,
        builder: (context, snapshot) {
          
        },
      ),
      */
    );
  }
}
