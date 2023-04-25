import 'package:dio/dio.dart';
import 'package:movie_app_clean_architecture/core/error/exception.dart';
import 'package:movie_app_clean_architecture/movies/data/models/movie_model.dart';

import '../../../core/network/api_constants.dart';
import '../../../core/network/error_message_model.dart';
import '../../domain/entities/recommendation.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_recommendation_movies_usecase.dart';
import '../models/movie_deails_model.dart';
import '../models/recommendation_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMoviesDetails(MovieDetailsParameters parameters);
  Future<List<Recommendation>> getRecommendationMovies(RecommendationMoviesParameters parameters);

}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(APIConstants.nowPlayingEndPoint);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List)
            .map(
              (e) => MovieModel.fromJson(e),
            )
            ,
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
  
  @override
  Future<MovieDetailsModel> getMoviesDetails(MovieDetailsParameters parameters)async {
   final response = await Dio().get(APIConstants.movieDetailsPath(parameters.movieId));
    if (response.statusCode == 200) {
      return  MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }
  
  @override
  Future<List<Recommendation>> getRecommendationMovies(RecommendationMoviesParameters parameters) async{
 final response = await Dio().get(APIConstants.recommendationMoviesPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
        response.data['results']
            .map(
              (e) => RecommendationModel.fromJson(e),
            )
            .toList());
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }
}
