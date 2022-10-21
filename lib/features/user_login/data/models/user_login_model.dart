import 'package:practice_clean_architecture/features/user_login/domain/entities/user_login.dart';

class UserLoginModel extends UserLogin {
  final String? id;
  final String? userId;
  final String? userName;
  final String? eMail;
  final String? mobileNo;
  final String? password;
  final String? city;
  final String? address;
  final String? dateCreated;

  const UserLoginModel({
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

  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    return UserLoginModel(
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
