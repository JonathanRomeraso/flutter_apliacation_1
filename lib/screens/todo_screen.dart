import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/task_database.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TaskDatabase? database;

  @override
  void initState() {
    super.initState();
    database = TaskDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: FutureBuilder(
        future: database!.SELECT(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Ocurrio un errror durante la ejecucion"),
            );
          } else {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return null;
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }
}
