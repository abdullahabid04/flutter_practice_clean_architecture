import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:practice_clean_architecture/features/user_login/domain/entities/user_login.dart';

@immutable
abstract class UserLoginState extends Equatable {
  const UserLoginState();

  @override
  List<Object> get props => [];
}

@immutable
class UserLoginEmptyState extends UserLoginState {
  const UserLoginEmptyState();
}

@immutable
class UserLoginLoadingState extends UserLoginState {
  const UserLoginLoadingState();
}

@immutable
class UserLoginLoadedState extends UserLoginState {
  final UserLogin userLogin;

  const UserLoginLoadedState({
    required this.userLogin,
  });

  @override
  List<Object> get props => [
        userLogin,
      ];
}

@immutable
class UserLoginErrorState extends UserLoginState {
  final String message;

  const UserLoginErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
