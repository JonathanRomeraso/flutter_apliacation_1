class PopularModel {
  String backdropPath;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  double voteAverage;
  int voteCount;

  PopularModel({
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  factory PopularModel.fromMap(Map<String, dynamic> pupular) {
    return PopularModel(
      backdropPath: pupular['backdrop_path'],
      id: pupular['id'],
      originalLanguage: pupular['original_language'],
      originalTitle: pupular['original_title'],
      overview: pupular['overview'],
      popularity: pupular['popularity'],
      posterPath: pupular['poster_path'],
      releaseDate:
          pupular['release_date'], //DateTime.parse(pupular['release_date']),
      title: pupular['title'],
      voteAverage: pupular['vote_average'],
      voteCount: pupular['vote_count'],
    );
  }
}
