import 'package:movie_app_clean_architecture/movies/domain/entities/movie_details.dart';

import 'genres_model.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
    required super.backdropPath,
    required super.geners,
    required super.overview,
    required super.releaseData,
    required super.title,
    required super.voteAverage,
    required super.runtime,
  });
  factory MovieDetailsModel.fromJson(Map jsonData) {
    return MovieDetailsModel(
      id: jsonData['id'],
      backdropPath: jsonData['backdropPath'],
      geners:
          List.from(jsonData['geners'].map((x) => GeneresModel.fromJson(x))),
      overview: jsonData['overview'],
      releaseData: jsonData['release_data'],
      title: jsonData['title'],
      voteAverage: jsonData['vote_average'],
      runtime: jsonData['runtime'],
    );
  }
}
