import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/core/utils/enums.dart';

import '../../data/datasource/movie_remote_data_source.dart';
import '../../data/repository/movies_repsitory.dart';
import '../../domain/repository/base_movie_repository.dart';
import '../../domain/usecases/get_now_playing_movies_usecase.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(const MoviesState()) {
    on<MoviesEvent>((MoviesEvent event, Emitter<MoviesState> emit) async {
      BaseMovieRemoteDataSource baseMovieRemoteDataSource =
          MovieRemoteDataSource();
      BaseMovieRepository baseMovieRepository =
          MovieRepository(baseMovieRemoteDataSource);
         
      final result =
          await GetNowPlayingMoviesUseCase(baseMovieRepository).execute();
          //  print(result);
      result.fold(
          (l) => emit(MoviesState(
              message: l.errorMessage, nowPlayingState: RequestState.error)),
          (r) =>emit (MoviesState(
              nowPlayingMovies: r, nowPlayingState: RequestState.loaded)));
    });
  }
}
