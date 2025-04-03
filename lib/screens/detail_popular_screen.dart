import 'package:flutter/material.dart';
import 'package:flutter_application_1/apis/popular_api.dart';
import 'package:flutter_application_1/models/popular_model.dart';
import 'package:flutter_application_1/models/trailer_model.dart';
import 'package:flutter_application_1/views/card_actor.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DetailPopularScreen extends StatefulWidget {
  final PopularModel? popularModel;
  const DetailPopularScreen({super.key, this.popularModel});

  @override
  State<DetailPopularScreen> createState() => _DetailPopularScreenState();
}

class _DetailPopularScreenState extends State<DetailPopularScreen> {
  //YoutubePlayerController? _controller;
  PopularApi? popularApi;

  @override
  initState() {
    super.initState();
    popularApi = PopularApi();
    //_controller = YoutubePlayerController.fromVideoId(
    //videoId: "uIrGCYolQVs",
    //autoPlay: false,
    //);
  }

  @override
  Widget build(BuildContext context) {
    final popolar = ModalRoute.of(context)!.settings.arguments as PopularModel;
    const space = SizedBox(height: 10);

    return Scaffold(
      appBar: AppBar(
        title: Text(popolar.title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Colors.white,
              Colors.black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: [
            // Trailer
            FutureBuilder<TrailerModel?>(
              future: popularApi!.fetchTrailer(popolar.id.toString()),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    height: 230,
                    color: Colors.grey[800],
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                if (snapshot.hasData) {
                  final trailer = snapshot.data!;
                  return Container(
                    padding: const EdgeInsets.all(10),
                    height: 230,
                    child: YoutubePlayer(
                      controller: YoutubePlayerController.fromVideoId(
                        videoId: trailer.key,
                        autoPlay: true,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                    ),
                    padding: const EdgeInsets.all(10),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.videocam_off_rounded,
                              size: 14,
                              color: Colors.white54,
                            ),
                            Text(
                              '  Trailer no disponible',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Disfruta de este video alternativo',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .85,
                          height: 165,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: YoutubePlayer(
                              controller: YoutubePlayerController.fromVideoId(
                                videoId: "uIrGCYolQVs",
                                autoPlay: true,
                              ),
                              aspectRatio: 16 / 9,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),

            // Overview
            space,
            Container(
              padding: const EdgeInsets.only(left: 10),
              height: 200,
              child: Row(
                children: [
                  Hero(
                    tag:
                        'https://image.tmdb.org/t/p/w500/${popolar.posterPath}',
                    child: Image.network(
                        'https://image.tmdb.org/t/p/w500/${popolar.posterPath}'),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: MediaQuery.of(context).size.width * .6,
                    child: Text(
                      popolar.overview,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),

            // Raiting
            space,
            SizedBox(
              height: 70,
              child: StarRating(
                rating: popolar.voteAverage / 2,
                color: Colors.amber,
                borderColor: Colors.white,
                starCount: 5,
              ),
            ),

            // Cast
            space,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Center(
                child: Text(
                  'Reparto Principal',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            FutureBuilder(
              future: popularApi!.fetchCast(popolar.id.toString()),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List actors = snapshot.data;
                  return SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: actors.length > 10 ? 10 : actors.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ActorCard(cast: snapshot.data![index]);
                      },
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

  

































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