import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/core/error/failure.dart';

abstract class BaseUseCase<T> {
  Future<Either<Failure, T>> call();
}
