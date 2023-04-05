import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/core/error/failure.dart';
import 'package:movie_app_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/movie.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_top_rated_movies_usecase.dart';

import '../../domain/usecases/get_now_playing_movies_usecase.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    //now playing event
    on<GetNowPlayingMoviesEvent>(getNowPlayingMovies);

    //popular event
    on<GetPopularMoviesEvent>(getPopularMovies);
    //topRated event
    on<GetTopRatedMoviesEvent>(getTopRatedMovies);
  }

  FutureOr<void> getTopRatedMovies(event, emit) async {
    final Either<Failure, List<Movie>> result =
        await getTopRatedMoviesUseCase();
    result.fold(
        (l) => emit(
              state.copyWith(
                  topRatedMessage: l.errorMessage,
                  topRatedState: RequestState.error),
            ),
        (r) => emit(
             state.copyWith(
                  topRatedMovies: r,
                  topRatedState: RequestState.loaded),
            ),);
  }

  FutureOr<void> getPopularMovies(event, emit) async {
    final Either<Failure, List<Movie>> result =
        await getPopularMoviesUseCase();
    result.fold(
        (l) => emit(
              state.copyWith(
                  popularMessage: l.errorMessage,
                  popularState: RequestState.error),
            ),
        (r) => emit(
              state.copyWith(
                  popularMovies: r,
                  popularState: RequestState.loaded),
            ),);
  }

  FutureOr<void> getNowPlayingMovies(MoviesEvent event, Emitter<MoviesState> emit) async {
    final Either<Failure, List<Movie>> result =
        await getNowPlayingMoviesUseCase();
    //  print(result);
    result.fold(
      (l) => emit(
        state.copyWith(nowPlayingMessage: l.errorMessage, nowPlayingState: RequestState.error)
        
      ),
      (r) => emit(
       state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
        ),
      ),
    );
  }
}