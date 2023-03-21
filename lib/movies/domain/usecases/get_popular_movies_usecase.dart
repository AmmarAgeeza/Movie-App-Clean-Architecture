import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/movie.dart';
import 'package:movie_app_clean_architecture/movies/domain/repository/base_movie_repository.dart';

import '../../../core/error/failure.dart';

class GetPopularMoviesUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUseCase(this.baseMovieRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMovieRepository.getPopularMovies();
  }
}
