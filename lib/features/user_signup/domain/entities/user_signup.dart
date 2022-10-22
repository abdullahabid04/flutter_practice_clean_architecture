import 'package:equatable/equatable.dart';

class UserSignUp extends Equatable {
  final int? status;
  final String? message;
  final String? userId;
  final int? code;
  final User? user;

  const UserSignUp({
    this.status,
    this.message,
    this.userId,
    this.code,
    this.user,
  });

  @override
  List<Object?> get props => [
        status,
        message,
        userId,
        code,
        user,
      ];
}

class User extends Equatable {
  final String? id;
  final String? userId;
  final String? userName;
  final String? eMail;
  final String? mobileNo;
  final String? password;
  final String? city;
  final String? address;
  final String? dateCreated;

  const User({
    this.id,
    this.userId,
    this.userName,
    this.eMail,
    this.mobileNo,
    this.password,
    this.city,
    this.address,
    this.dateCreated,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        userName,
        eMail,
        mobileNo,
        password,
        city,
        address,
        dateCreated,
      ];
}
