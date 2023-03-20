import 'package:movie_app_clean_architecture/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerException(this.errorMessageModel);
}
