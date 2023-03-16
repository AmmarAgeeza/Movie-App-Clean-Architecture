import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final String releaseData;
  final double voteAverage;

  const Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.overview,
    required this.releaseData,
    required this.voteAverage,
  });

  @override
  List<Object> get props => [
        id,
        title,
        backdropPath,
        genreIds,
        overview,
        voteAverage,
        releaseData,
      ];
}

void main() {
  Movie movie1 = const Movie(
    id: 1,
    title: 'title',
    backdropPath: 'backdropPath',
    genreIds: [0, 1],
    overview: 'overview',
    voteAverage: 0,
    releaseData: '',
  );
  Movie movie2 = const Movie(
    id: 1,
    title: 'title',
    backdropPath: 'backdropPath',
    genreIds: [0, 1],
    overview: 'overview',
    voteAverage: 0,
    releaseData: '',
  );
  Movie movie3 = const Movie(
    id: 1,
    title: 'title',
    backdropPath: 'backdropPath',
    genreIds: [0, 1],
    overview: 'overview',
    voteAverage: 0,
    releaseData: '',
  );
  print(movie1 == movie2);
  print(movie3 == movie2);
  print(movie1.hashCode);
  print(movie2.hashCode);
  print(movie3.hashCode);
}
