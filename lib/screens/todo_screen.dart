import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/task_database.dart';
import 'package:flutter_application_1/models/todo_model.dart';

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
        title: Text("TODO LIST"),
      ),
      body: FutureBuilder(
        //SE procesa antes de generar
        future: database!.SELECT(),
        builder: (context, AsyncSnapshot<List<TodoModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Ocurrio un errror durante la ejecucion"),
              //Text (snapshot.error.toString())
            );
          } else {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var obj = snapshot.data![index];
                  return Container(
                    height: 150,
                    child: Column(
                      children: [
                        ListTile(
                          //title: Text(snapshot.data![index].titleTodo!),
                          title: Text(obj.titleTodo!),
                          subtitle: Text(obj.dateTodo!),
                          trailing: Builder(builder: (context) {
                            //Un widget
                            if (obj.sttTodo!) return Icon(Icons.check);
                            return Icon(Icons.close);
                          }),
                        ),
                        Text(obj.dscTodo!)
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_task),
          onPressed: () => _dialogBuilder(context)),
    );
  }

  /*
  */
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Add Task"),
          );
        });
  }
}
