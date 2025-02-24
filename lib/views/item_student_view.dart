import 'package:flutter/material.dart';

class ItemStudentView extends StatelessWidget {
  const ItemStudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      //width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0XFF006BD8)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Expanded(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage("https://i.pravatar.cc/207"),
              ),
              title: Text("Jonathan Rodriguez Romero"),
              subtitle: Text("No.Control: 21030021"),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.13,
            decoration: const BoxDecoration(
              //border: Border.all(color:Color(0XFF006BD8)),
              color: Color(0XFFEDF3FF),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Table(
                    children: const [
                      TableRow(
                        children: [
                          Center(child: Text("Semestre")),
                          Center(child: Text("Clave Materia")),
                          Center(child: Text("Grupo")),
                        ],
                      ),
                      TableRow(
                        children: [
                          Center(child: Text("6")),
                          Center(child: Text("DM13")),
                          Center(child: Text("B")),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 16,),
                  Text("INGENIERIA EN SITEMAS COMPUTACIONALES",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
