import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase/todo_firebase.dart';
import 'package:intl/intl.dart';

class TodoFirebaseScreen extends StatefulWidget {
  const TodoFirebaseScreen({super.key});

  @override
  State<TodoFirebaseScreen> createState() => _TodoFirebaseScreenState();
}

class _TodoFirebaseScreenState extends State<TodoFirebaseScreen> {
  TodoFirebase? todoFirebase;

  TextEditingController conTitle = TextEditingController();
  TextEditingController conDesc = TextEditingController();
  TextEditingController conDate = TextEditingController();
  TextEditingController conStts = TextEditingController();

  @override
  void initState() {
    todoFirebase = TodoFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _dialogBuilder(context),
        child: Icon(Icons.add_task),
      ),
      appBar: AppBar(
        title: Text("Lista de Tareas"),
      ),
      body: StreamBuilder(
        stream: todoFirebase!.selectTask(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var obj = snapshot.data!.docs[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey),
                      height: 150,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(obj.get("titleTodo")),
                            subtitle: Text(obj.get("dateTodo")),
                            trailing: Builder(builder: (context) {
                              if (obj.get("sttTodo")) {
                                return Icon(Icons.check);
                              }
                              return Icon(Icons.close);
                            }),
                          ),
                          Text(obj.get("descTodo")),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    conTitle.text = obj.get("titleTodo");
                                    conDesc.text = obj.get("descTodo");
                                    conDate.text = obj.get("dateTodo");
                                    conStts.text = obj.get("sttTodo").toString();
                                    _dialogBuilder(context, obj.id);
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    size: 35,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    todoFirebase!
                                        .deleteTask(obj.id)
                                        .then((value) {});
                                  },
                                  icon: Icon(Icons.delete, size: 35))
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Center(child: Text("Error"));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context, [String? idTodo]) {
    bool isEditing = idTodo != null;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(isEditing ? "Editar Tarea" : "Agregar Tarea"),
            content: SizedBox(
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
                      
                    }
                  },
                ),
                TextFormField(
                    controller: conStts,
                    decoration:
                        InputDecoration(hintText: "Estatus de la tarea")),
                Divider(),
                ElevatedButton(
                    onPressed: () {
                      Map<String, dynamic> taskData = {
                        "titleTodo": conTitle.text,
                        "descTodo": conDesc.text,
                        "dateTodo": conDate.text,
                        "sttsTodo": conStts.text.toLowerCase() == 'true'
                      };
                      if (isEditing) {
                        todoFirebase!.updateTask(taskData, idTodo);
                      } else {
                        todoFirebase!.addTask(taskData);
                      }

                      Navigator.pop(context);
                    },
                    child: Text('Guardar'))
              ]),
            ),
          );
        });
  }
}
