import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class GenericFailure extends Failure {}

class InvalidCredentialsFailure extends Failure {}

class UserNotCreatedFailure extends Failure {}

class UserNotVerifiedFailure extends Failure {}
