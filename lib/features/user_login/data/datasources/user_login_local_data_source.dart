import 'package:practice_clean_architecture/core/errors/exceptions/exceptions.dart';
import 'package:practice_clean_architecture/userpreferances/local_user_data.dart';

import '../models/user_login_model.dart';

abstract class UserLoginLocalDataSource {
  Future<UserLoginModel> getUserLogin(String mobileNo, String password);
}

class UserLoginLocalDataSourceImplementation
    implements UserLoginLocalDataSource {
  final LocalUserData localUserData;

  UserLoginLocalDataSourceImplementation({
    required this.localUserData,
  });

  @override
  Future<UserLoginModel> getUserLogin(String mobileNo, String password) async {
    Map<String, dynamic> userData = localUserData.getUserData();
    String? userMobileNo = userData['mobile_no'];
    String? userAccountPassword = userData['password'];

    if (mobileNo == userMobileNo && password == userAccountPassword) {
      return UserLoginModel.fromJson(userData);
    } else {
      throw InvalidCredentialsException();
    }
  }
}
