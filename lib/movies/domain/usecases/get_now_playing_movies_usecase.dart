import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/core/base_use_case/base_use_case.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/movie.dart';
import 'package:movie_app_clean_architecture/movies/domain/repository/base_movie_repository.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>> {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}
