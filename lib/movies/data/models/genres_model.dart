import 'package:movie_app_clean_architecture/movies/domain/entities/geners.dart';

class GeneresModel extends Geners {
  const GeneresModel({required super.name, required super.id});
  factory GeneresModel.fromJson(Map jsonData) {
    return GeneresModel(name: jsonData['name'], id: jsonData['id']);
  }
}
