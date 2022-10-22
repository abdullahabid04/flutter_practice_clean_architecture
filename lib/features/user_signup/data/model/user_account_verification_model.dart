import 'package:practice_clean_architecture/features/user_signup/domain/entities/user_account_verification.dart';

class UserAccountVerificationModel extends UserAccountVerification {
  int? status;
  String? message;

  UserAccountVerificationModel({
    this.status,
    this.message,
  }) : super(
          status: status,
          message: message,
        );

  factory UserAccountVerificationModel.fromJson(Map<String, dynamic> json) {
    return UserAccountVerificationModel(
      status: json['status'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
