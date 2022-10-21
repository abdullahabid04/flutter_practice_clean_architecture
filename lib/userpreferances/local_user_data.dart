import 'package:practice_clean_architecture/features/user_login/data/models/user_login_model.dart';
import 'package:practice_clean_architecture/userpreferances/user_preferances.dart';

abstract class LocalUserData {
  Map<String, dynamic> getUserData();

  set setUserData(UserLoginModel userLoginModel);

  bool get isAccountCreated;

  bool get isAccountVerified;

  bool get isLoggedIn;
}

class LocalUserDataImplementation implements LocalUserData {
  @override
  set setUserData(UserLoginModel userLoginModel) {
    UserSharedPreferences.setUserId(int.parse(userLoginModel.id!.toString()));
    UserSharedPreferences.setUserUniqueId(userLoginModel.userId!);
    UserSharedPreferences.setUserName(userLoginModel.userName!);
    UserSharedPreferences.setUserEmail(userLoginModel.eMail!);
    UserSharedPreferences.setUserMobileNo(userLoginModel.mobileNo!);
    UserSharedPreferences.setUserAccountPassword(userLoginModel.password!);
    UserSharedPreferences.setUserCity(userLoginModel.city!);
    UserSharedPreferences.setUserAddress(userLoginModel.address!);
    UserSharedPreferences.setUserCreatedDate(userLoginModel.dateCreated!);
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
}
