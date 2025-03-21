import 'package:flutter/material.dart';
import 'package:flutter_application_1/apis/popular_api.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  PopularApi? popularApi;
  @override
  void initState() {
    super.initState();
    popularApi = PopularApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Popular Movies'),
        ),
        body: FutureBuilder(
          future: popularApi!.getHttpPopular(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return;
                },
              );
            } else {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Ocurrio un error durante la ejecucion"),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
