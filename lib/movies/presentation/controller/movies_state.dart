import 'package:equatable/equatable.dart';
import 'package:movie_app_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final String message;
  final RequestState nowPlayingState;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.message = '',
    this.nowPlayingState = RequestState.loading,
  });

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        message,
      ];
}
