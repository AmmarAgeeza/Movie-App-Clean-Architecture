import 'package:equatable/equatable.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/geners.dart';

class MovieDetails extends Equatable {
  final int id;
  final String backdropPath;
  final List<Geners> geners;
  final String overview;
  final String releaseData;
  final String title;
  final String voteAverage;
  final int runtime;

  const MovieDetails({
    required this.id,
    required this.backdropPath,
    required this.geners,
    required this.overview,
    required this.releaseData,
    required this.title,
    required this.voteAverage,
    required this.runtime,
  });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        geners,
        overview,
        releaseData,
        title,
        voteAverage,
        runtime
      ];
}
