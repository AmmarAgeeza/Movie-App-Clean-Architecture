import 'package:movie_app_clean_architecture/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    required super.id,
    required super.backdropPath,
  });
  factory RecommendationModel.fromJson(Map jsonData) {
    return RecommendationModel(
      id: jsonData['id'],
      backdropPath: jsonData['backdrop_path']??'/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg',
    );
  }
}
