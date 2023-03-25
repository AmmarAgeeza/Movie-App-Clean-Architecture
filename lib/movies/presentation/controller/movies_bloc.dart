import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/core/utils/enums.dart';

import '../../domain/usecases/get_now_playing_movies_usecase.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(const MoviesState()) {
    on<MoviesEvent>((MoviesEvent event, Emitter<MoviesState> emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      //  print(result);
      result.fold(
          (l) => emit(MoviesState(
              message: l.errorMessage, nowPlayingState: RequestState.error)),
          (r) => emit(MoviesState(
              nowPlayingMovies: r, nowPlayingState: RequestState.loaded)));
    });
  }
}
