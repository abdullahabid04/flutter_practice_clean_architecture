import 'package:practice_clean_architecture/features/user_login/data/models/user_login_model.dart';
import 'package:practice_clean_architecture/features/user_signup/data/model/user_signup_model.dart';
import 'package:practice_clean_architecture/userpreferances/user_preferances.dart';

abstract class LocalUserData {
  Map<String, dynamic> getUserData();

  Future<void> setUserLoginData(UserLoginModel userLoginModel);

  Future<void> setUserSignUpData(UserSignUpModel userSignUpModel);

  bool get isAccountCreated;

  bool get isAccountVerified;

  bool get isLoggedIn;
}

class LocalUserDataImplementation implements LocalUserData {
  @override
  Future<void> setUserLoginData(UserLoginModel userLoginModel) async {
    await UserSharedPreferences.setUserId(
        int.parse(userLoginModel.id!.toString()));
    await UserSharedPreferences.setUserUniqueId(userLoginModel.userId!);
    await UserSharedPreferences.setUserName(userLoginModel.userName!);
    await UserSharedPreferences.setUserEmail(userLoginModel.eMail!);
    await UserSharedPreferences.setUserMobileNo(userLoginModel.mobileNo!);
    await UserSharedPreferences.setUserAccountPassword(
        userLoginModel.password!);
    await UserSharedPreferences.setUserCity(userLoginModel.city!);
    await UserSharedPreferences.setUserAddress(userLoginModel.address!);
    await UserSharedPreferences.setUserCreatedDate(userLoginModel.dateCreated!);
  }

  @override
  Map<String, dynamic> getUserData() {
    Map<String, dynamic> userData = <String, dynamic>{
      "id": UserSharedPreferences.getUserId() ?? "",
      "user_id": UserSharedPreferences.getUserUniqueId() ?? "",
      "user_name": UserSharedPreferences.getUserName() ?? "",
      "e_mail": UserSharedPreferences.getUserEmail() ?? "",
      "mobile_no": UserSharedPreferences.getUserMobileNo() ?? "",
      "password": UserSharedPreferences.getUserAccountPassword() ?? "",
      "city": UserSharedPreferences.getUserCity() ?? "",
      "address": UserSharedPreferences.getUserAddress() ?? "",
      "date_created": UserSharedPreferences.getUserCreatedDate() ?? "",
    };
    return userData;
  }

  @override
  bool get isAccountCreated =>
      UserSharedPreferences.getAccountCreated() ?? false;

  @override
  bool get isAccountVerified =>
      UserSharedPreferences.getAccountVerified() ?? false;

  @override
  bool get isLoggedIn => UserSharedPreferences.getLoggedIn() ?? false;

  @override
  Future<void> setUserSignUpData(UserSignUpModel userSignUpModel) async {
    await UserSharedPreferences.setUserId(
        int.parse(userSignUpModel.user!.id!.toString()));
    await UserSharedPreferences.setUserUniqueId(userSignUpModel.user!.userId!);
    await UserSharedPreferences.setUserName(userSignUpModel.user!.userName!);
    await UserSharedPreferences.setUserEmail(userSignUpModel.user!.eMail!);
    await UserSharedPreferences.setUserMobileNo(
        userSignUpModel.user!.mobileNo!);
    await UserSharedPreferences.setUserAccountPassword(
        userSignUpModel.user!.password!);
    await UserSharedPreferences.setUserCity(userSignUpModel.user!.city!);
    await UserSharedPreferences.setUserAddress(userSignUpModel.user!.address!);
    await UserSharedPreferences.setUserCreatedDate(
        userSignUpModel.user!.dateCreated!);
  }
}
