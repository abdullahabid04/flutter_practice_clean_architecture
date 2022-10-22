import 'package:practice_clean_architecture/features/user_signup/domain/entities/user_signup.dart';

class UserSignUpModel extends UserSignUp {
  int? status;
  String? message;
  String? userId;
  int? code;
  UserModel? user;

  UserSignUpModel({
    this.status,
    this.message,
    this.userId,
    this.code,
    this.user,
  }) : super(
          status: status,
          message: message,
          userId: userId,
          code: code,
          user: user,
        );

  factory UserSignUpModel.fromJson(Map<String, dynamic> json) {
    return UserSignUpModel(
      status: json['status'],
      message: json['message'],
      userId: json['user_id'],
      code: json['code'],
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    data['message'] = this.message;
    data['user_id'] = this.userId;
    data['code'] = this.code;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class UserModel extends User {
  String? id;
  String? userId;
  String? userName;
  String? eMail;
  String? mobileNo;
  String? password;
  String? city;
  String? address;
  String? dateCreated;

  UserModel({
    this.id,
    this.userId,
    this.userName,
    this.eMail,
    this.mobileNo,
    this.password,
    this.city,
    this.address,
    this.dateCreated,
  }) : super(
          id: id,
          userId: userId,
          userName: userName,
          eMail: eMail,
          mobileNo: mobileNo,
          password: password,
          city: city,
          address: address,
          dateCreated: dateCreated,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      userId: json['user_id'],
      userName: json['user_name'],
      eMail: json['e_mail'],
      mobileNo: json['mobile_no'],
      password: json['password'],
      city: json['city'],
      address: json['address'],
      dateCreated: json['date_created'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['e_mail'] = this.eMail;
    data['mobile_no'] = this.mobileNo;
    data['password'] = this.password;
    data['city'] = this.city;
    data['address'] = this.address;
    data['date_created'] = this.dateCreated;
    return data;
  }
}
