import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:practice_clean_architecture/features/user_signup/domain/entities/user_signup.dart';

@immutable
abstract class UserSignUpState extends Equatable {
  const UserSignUpState();

  @override
  List<Object> get props => [];
}

@immutable
class UserSignUpInitialState extends UserSignUpState {
  const UserSignUpInitialState();

  @override
  List<Object> get props => [];
}

@immutable
class UserSignUpLoadingState extends UserSignUpState {
  const UserSignUpLoadingState();

  @override
  List<Object> get props => [];
}

@immutable
class UserSignUpAccountCreatedState extends UserSignUpState {
  final UserSignUp userSignUp;

  const UserSignUpAccountCreatedState({
    required this.userSignUp,
  });

  @override
  List<Object> get props => [
        userSignUp,
      ];
}

@immutable
class UserSignUpAccountNotCreatedState extends UserSignUpState {
  const UserSignUpAccountNotCreatedState();

  @override
  List<Object> get props => [];
}

@immutable
class UserSignUpErrorState extends UserSignUpState {
  final String title;
  final String message;

  const UserSignUpErrorState({
    required this.title,
    required this.message,
  });

  @override
  List<Object> get props => [
        title,
        message,
      ];
}

@immutable
class UserSignUpAccountVerifiedState extends UserSignUpState {
  const UserSignUpAccountVerifiedState();

  @override
  List<Object> get props => [];
}

@immutable
class UserSignUpAccountNotVerifiedState extends UserSignUpState {
  const UserSignUpAccountNotVerifiedState();

  @override
  List<Object> get props => [];
}
