import 'package:get_it/get_it.dart';
import 'package:movie_app_clean_architecture/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_app_clean_architecture/movies/presentation/controller/movies_bloc.dart';

import '../../movies/data/datasource/movie_remote_data_source.dart';
import '../../movies/data/repository/movies_repsitory.dart';
import '../../movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    /// Bloc
    sl.registerFactory(() => MoviesBloc(
          sl(),
          sl(),
          sl(),
        ));
    sl.registerFactory(() => MovieDetailsBloc(
          sl(),
        ));

    /// Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    /// Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
