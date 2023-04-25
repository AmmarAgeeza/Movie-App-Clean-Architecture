import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/movie.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/recommendation.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_recommendation_movies_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie_details.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters);
  Future<Either<Failure, List<Recommendation>>> getRecommendationMovie(RecommendationMoviesParameters parameters);
}
