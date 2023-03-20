import 'package:dio/dio.dart';
import 'package:movie_app_clean_architecture/core/error/exception.dart';
import 'package:movie_app_clean_architecture/movies/data/models/movie_model.dart';

import '../../../core/network/error_message_model.dart';

class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=5ba40f59e6a8325930ebab075ccd9e9d');
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        response.data['results']
            .map(
              (e) => MovieModel.fromJson(e),
            )
            .toList(),
      );
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }
}
