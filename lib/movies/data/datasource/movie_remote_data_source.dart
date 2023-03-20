import 'package:dio/dio.dart';
import 'package:movie_app_clean_architecture/core/error/exception.dart';
import 'package:movie_app_clean_architecture/movies/data/models/movie_model.dart';

import '../../../core/network/api_constants.dart';
import '../../../core/network/error_message_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(APIConstants.nowPlayingEndPoint);
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

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(APIConstants.popularEndPoint);
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

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(APIConstants.topRatedEndPoint);
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
