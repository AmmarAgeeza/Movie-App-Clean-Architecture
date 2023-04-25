import 'package:equatable/equatable.dart';
import 'package:movie_app_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/movie_details.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
     this.movieDetails,
     this.movieDetailsRequestState=RequestState.loading,
     this.movieDetailsMessage='',
  });

  final MovieDetails? movieDetails;
  final RequestState movieDetailsRequestState;
  final String movieDetailsMessage;

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsRequestState,
    String? movieDetailsMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsRequestState: movieDetailsRequestState ?? this.movieDetailsRequestState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
    );
  }

  @override
  List<Object?> get props => [movieDetails, movieDetailsRequestState, movieDetailsMessage];
}
