import 'package:flutter/material.dart';
import 'package:flutter_application_1/apis/popular_api.dart';
import 'package:flutter_application_1/models/popular_model.dart';
//import 'package:flutter_application_1/screens/detail_popular_screen.dart';

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
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ItemPopular(
                    snapshot.data![index],
                  );
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

  Widget ItemPopular(PopularModel popular) {
    return InkWell(
      onTap: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPopularScreen(popularModel: popular)));
        Navigator.pushNamed(context, "/detail", arguments: popular);
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

          /*image: DecorationImage(
            image: NetworkImage(
                'https://image.tmdb.org/t/p/w500${popular.posterPath}'),
            fit: BoxFit.cover,
          ),*/
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Hero(
            tag: 'https://image.tmdb.org/t/p/w500/${popular.posterPath}',
            child: FadeInImage(
              fadeInDuration: Duration(seconds: 3),
              placeholder: const AssetImage('assets/Gif/loading.gif'),
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500/${popular.posterPath}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
