import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/movie_details.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_movie_details_usecase.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/enums.dart';
import 'movie_details_event.dart';
import 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  MovieDetailsBloc(this.getMovieDetailsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final Either<Failure, MovieDetails> result =
        await getMovieDetailsUseCase(MovieDetailsParameters(event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
            movieDetailsMessage: l.errorMessage,
            movieDetailsRequestState: RequestState.error),
      ),
      (r) => emit(
        state.copyWith(
            movieDetails: r, movieDetailsRequestState: RequestState.loaded),
      ),
    );
  }
}
