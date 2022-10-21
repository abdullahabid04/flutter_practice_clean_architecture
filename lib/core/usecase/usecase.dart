import 'package:dartz/dartz.dart';
import 'package:practice_clean_architecture/core/errors/failures/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
