import 'package:practice_clean_architecture/utils/network_util.dart';

import '../../../../constants/server_complete_urls.dart';
import '../../../../core/errors/exceptions/exceptions.dart';
import '../model/user_account_verification_model.dart';

abstract class UserAccountVerificationRemoteDataSource {
  Future<UserAccountVerificationModel> getUSerAccountVerification(
    String userId,
    String verificationCode,
  );
}

class UserAccountVerificationRemoteDataSourceImplementation
    implements UserAccountVerificationRemoteDataSource {
  final NetworkUtil _networkUtil = NetworkUtil();

  @override
  Future<UserAccountVerificationModel> getUSerAccountVerification(
      String userId, String verificationCode) async {
    try {
      return await _networkUtil.post(
        USER_VERIFY,
        body: {
          "user_id": userId,
          "verification_code": verificationCode,
        },
      ).then((value) {
        return UserAccountVerificationModel.fromJson(value);
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
