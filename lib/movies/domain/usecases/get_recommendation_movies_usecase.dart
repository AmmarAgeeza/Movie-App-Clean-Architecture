import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_clean_architecture/core/base_use_case/base_use_case.dart';
import 'package:movie_app_clean_architecture/core/error/failure.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/recommendation.dart';
import 'package:movie_app_clean_architecture/movies/domain/repository/base_movie_repository.dart';

class GetRecommendationMoviesUsecase
    extends BaseUseCase<List<Recommendation>, RecommendationMoviesParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationMoviesUsecase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationMoviesParameters parameters) async {
    return await baseMovieRepository.getRecommendationMovie(parameters);
  }
}

class RecommendationMoviesParameters extends Equatable {
  final int id;

  const RecommendationMoviesParameters(this.id);

  @override
  List<Object?> get props => [id];
}
