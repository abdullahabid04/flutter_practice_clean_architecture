import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class UserLoginEvent extends Equatable {
  const UserLoginEvent();

  @override
  List<Object> get props => [];
}

@immutable
class GetUserLoginEvent implements UserLoginEvent {
  final String mobileNo;
  final String password;

  const GetUserLoginEvent(
    this.mobileNo,
    this.password,
  );

  @override
  List<Object> get props => [
        mobileNo,
        password,
      ];

  @override
  bool? get stringify => true;
}
