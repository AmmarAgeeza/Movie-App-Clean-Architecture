import 'package:movie_app_clean_architecture/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.releaseData,
    required super.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieModel(
      id: jsonData['id'],
      title: jsonData['title'],
      backdropPath: jsonData['backdrop_path'],
      genreIds: List.from(jsonData['genre_ids'].map((e) => e)),
      overview: jsonData['overview'],
      releaseData: jsonData['release_date'],
      voteAverage: jsonData['vote_average'].toDouble(),
    );
  }
}
