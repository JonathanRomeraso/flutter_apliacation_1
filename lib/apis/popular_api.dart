import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/cast_model.dart';
import 'package:flutter_application_1/models/popular_model.dart';
import 'package:flutter_application_1/models/trailer_model.dart';
import 'package:flutter_application_1/utils/keys.dart';

class PopularApi {
  final dio = Dio();
  final key = Keys.apiKey;

  Future<List<PopularModel>?> getHttpPopular() async {
    Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=$key&language=es-MX&page=1');
    if (response.statusCode == 200) {
      final res = response.data['results'] as List;
      return res.map((movie) => PopularModel.fromMap(movie)).toList();
    } else {
      throw Exception(
          'Failed to load cast: Status code ${response.statusCode}');
    }
  }

  Future<List<CastModel>?> fetchCast(String id) async {
    Response response = await dio.get(
      'https://api.themoviedb.org/3/movie/$id/credits?api_key=$key&language=es-Mx',
    );    
    if (response.statusCode == 200) {
      final res = response.data['cast'] as List;
      return res.map((cast) => CastModel.fromMap(cast)).toList();
    } else {
      throw Exception(
          'Failed to load cast: Status code ${response.statusCode}');
    }
  }

  Future<TrailerModel?> fetchTrailer(String id) async {
    Response response = await dio.get(
      'https://api.themoviedb.org/3/movie/$id/videos?api_key=$key&language=es-ES',
    );
    if (response.statusCode == 200) {
      final res = response.data['results'] as List;

      final trailer = res.firstWhere(
        (video) => video['official'] == true && video['type'] == 'Trailer',
        orElse: () => null,
      );
      final officialVideo = trailer ??
          res.firstWhere(
            (video) =>
                video['official'] == true &&
                (video['type'] == 'Teaser' || video['type'] == 'Featurette'),
            orElse: () => null,
          );
      if (officialVideo != null) {
        return TrailerModel.fromMap(officialVideo);
      } else {
        return null;
      }

      //return TrailerModel.fromMap(res.first);
    } else {
      throw Exception(
          'Failed to load cast: Status code ${response.statusCode}');
    }
  }
}
