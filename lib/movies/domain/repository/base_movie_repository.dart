import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/movie.dart';

import '../../../core/error/failure.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
}
