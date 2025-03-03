import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/database/task_database.dart';
import 'package:flutter_application_1/models/todo_model.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TaskDatabase? database;
  TextEditingController conTitle = TextEditingController();
  TextEditingController conDesc = TextEditingController();
  TextEditingController conDate = TextEditingController();
  TextEditingController conStts = TextEditingController();

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
            content: Container(
              height: 280,
              width: 300,
              child: ListView(children: [
                TextFormField(
                    controller: conTitle,
                    decoration:
                        InputDecoration(hintText: "Titulo de la tarea")),
                TextFormField(
                  controller: conDesc,
                  maxLines: 3,
                  decoration:
                      InputDecoration(hintText: "Descripcion de la tarea"),
                ),
                TextFormField(
                  readOnly: true,
                  controller: conDate,
                  decoration: InputDecoration(hintText: "Fecha de la tarea"),
                  onTap: () async {
                    DateTime? dateTodo = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100));
                    if (dateTodo != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(dateTodo);
                      setState(() {
                        conDate.text = formattedDate;
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
                TextFormField(
                    controller: conStts,
                    decoration:
                        InputDecoration(hintText: "Estatus de la tarea")),
              ]),
            ),
          );
        });
  }
}
