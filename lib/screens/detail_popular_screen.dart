import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/popular_model.dart';

class DetailPopularScreen extends StatefulWidget {
  DetailPopularScreen({super.key, this.popularModel});

  PopularModel? popularModel;

  @override
  State<DetailPopularScreen> createState() => _DetailPopularScreenState();
}

class _DetailPopularScreenState extends State<DetailPopularScreen> {
  @override
  Widget build(BuildContext context) {
    final popolar = ModalRoute.of(context)!.settings.arguments as PopularModel;
    const space = SizedBox(height: 10,);
    return Scaffold(
        appBar: AppBar(
          title: Text(popolar.title),
        ),
        body: Hero(
          tag: 'https://image.tmdb.org/t/p/w500/${popolar.posterPath}',
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                opacity: 0.5,
                image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500/${popolar.posterPath}',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView(
              children: [
                Container(
                  height: 230,
                  color: Colors.red,
                ),
                space,
                Container(
                  height: 200,
                  color: Colors.black,
                  child: Text(popolar.overview),
                ),
                space,
                Container(
                  height: 120,
                  color: Colors.yellow[200],
                ),
              ],
            ),
          ),
        )

        /*
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500/${popolar.posterPath}',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                popolar.overview,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      */
        /*
      appBar: AppBar(
        title: Text(widget.popularModel!.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500/${widget.popularModel!.posterPath}',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.popularModel!.overview,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      */
        );
  }
}
