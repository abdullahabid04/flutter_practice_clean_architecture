import 'package:practice_clean_architecture/utils/network_util.dart';

import '../../../../constants/server_complete_urls.dart';
import '../../../../core/errors/exceptions/exceptions.dart';
import '../model/user_signup_model.dart';

abstract class UserSignUpRemoteDataSource {
  Future<UserSignUpModel> getUserSignUp(
    String userName,
    String eMail,
    String password,
    String address,
    String city,
    String mobileNo,
  );
}

class UserSignUpRemoteDataSourceImplementation
    implements UserSignUpRemoteDataSource {
  final NetworkUtil _networkUtil = NetworkUtil();

  @override
  Future<UserSignUpModel> getUserSignUp(
    String userName,
    String eMail,
    String password,
    String address,
    String city,
    String mobileNo,
  ) async {
    try {
      return await _networkUtil.post(
        USER_SIGNUP,
        body: {
          "user_name": userName,
          "e_mail": eMail,
          "password": password,
          "address": address,
          "city": city,
          "mobile_no": mobileNo,
        },
      ).then((value) {
        return UserSignUpModel.fromJson(value);
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
