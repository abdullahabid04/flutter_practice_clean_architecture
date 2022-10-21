import 'package:practice_clean_architecture/constants/server_complete_urls.dart';
import 'package:practice_clean_architecture/core/errors/exceptions/exceptions.dart';
import 'package:practice_clean_architecture/utils/network_util.dart';

import '../models/user_login_model.dart';

abstract class UserLoginRemoteDataSource {
  Future<UserLoginModel> getUserLogin(String mobileNo, String password);
}

class UserLoginRemoteDataSourceImplementation
    implements UserLoginRemoteDataSource {
  final NetworkUtil _networkUtil = NetworkUtil();

  @override
  Future<UserLoginModel> getUserLogin(String mobileNo, String password) async {
    try {
      return await _networkUtil.post(
        USER_LOGIN,
        body: {
          "mobile_no": mobileNo,
          "password": password,
        },
      ).then((value) {
        return UserLoginModel.fromJson(value);
      });
    } on ServerException catch (error) {
      throw ServerException();
    } on GenericException catch (error) {
      throw GenericException();
    } on Exception catch (error) {
      throw GenericException();
    }
  }
}
