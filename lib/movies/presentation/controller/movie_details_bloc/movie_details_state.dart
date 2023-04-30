import 'package:equatable/equatable.dart';
import 'package:movie_app_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/movie_details.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/recommendation.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
     this.recommendationMovies=const [],
     this.recommendationMoviesState=RequestState.loading,
     this.recommendationMoviesMessage='',
    this.movieDetails,
    this.movieDetailsRequestState = RequestState.loading,
    this.movieDetailsMessage = '',
  });

  final MovieDetails? movieDetails;
  final RequestState movieDetailsRequestState;
  final String movieDetailsMessage;
  final List<Recommendation> recommendationMovies;
  final RequestState recommendationMoviesState;
  final String recommendationMoviesMessage;

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsRequestState,
    String? movieDetailsMessage,
      List<Recommendation>? recommendationMovies,
   RequestState? recommendationMoviesState,
   String? recommendationMoviesMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsRequestState:
          movieDetailsRequestState ?? this.movieDetailsRequestState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendationMovies: recommendationMovies??this.recommendationMovies,
      recommendationMoviesState: recommendationMoviesState??this.recommendationMoviesState,
      recommendationMoviesMessage: recommendationMoviesMessage??this.recommendationMoviesMessage,
    );
  }



@override
List<Object?> get props => [movieDetails, movieDetailsRequestState, movieDetailsMessage, recommendationMovies, recommendationMoviesState, recommendationMoviesMessage];
}
