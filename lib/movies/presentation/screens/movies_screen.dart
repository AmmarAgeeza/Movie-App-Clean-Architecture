import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/movie.dart';
import 'package:movie_app_clean_architecture/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_now_playing_movies_usecase.dart';

import '../../data/repository/movies_repsitory.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<Movie> movies=[];
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  void getData() async {
    BaseMovieRemoteDataSource baseMovieRemoteDataSource =
        MovieRemoteDataSource();
    BaseMovieRepository baseMovieRepository =
        MovieRepository(baseMovieRemoteDataSource);
    final result =
        await GetNowPlayingMoviesUseCase(baseMovieRepository).execute();
        result.fold((l) => null, (r) => movies=r);
        print(result);
  }
}
