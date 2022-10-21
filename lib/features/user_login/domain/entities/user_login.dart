import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class UserLogin extends Equatable {
  final String? id;
  final String? userId;
  final String? userName;
  final String? eMail;
  final String? mobileNo;
  final String? password;
  final String? city;
  final String? address;
  final String? dateCreated;

  const UserLogin({
    @required this.id,
    @required this.userId,
    @required this.userName,
    @required this.eMail,
    @required this.mobileNo,
    @required this.password,
    @required this.city,
    @required this.address,
    @required this.dateCreated,
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
