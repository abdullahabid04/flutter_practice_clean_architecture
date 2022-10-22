import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:practice_clean_architecture/features/user_signup/presentation/bloc/bloc.dart';

@immutable
abstract class UserSignUpEvent extends Equatable {
  const UserSignUpEvent();

  @override
  List<Object> get props => [];
}

@immutable
class CreateUserAccount implements UserSignUpEvent {
  final String userName;
  final String eMail;
  final String password;
  final String mobileNo;
  final String city;
  final String address;

  const CreateUserAccount(
    this.userName,
    this.eMail,
    this.password,
    this.mobileNo,
    this.city,
    this.address,
  );

  @override
  List<Object> get props => [
        userName,
        eMail,
        password,
        mobileNo,
        city,
        address,
      ];

  @override
  bool? get stringify => true;
}

@immutable
class VerifyUserAccount implements UserSignUpEvent {
  final String userId;
  final String verificationCode;

  const VerifyUserAccount(
    this.userId,
    this.verificationCode,
  );

  @override
  List<Object> get props => [
        userId,
        verificationCode,
      ];

  @override
  bool? get stringify => true;
}
