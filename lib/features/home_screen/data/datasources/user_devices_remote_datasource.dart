import 'package:practice_clean_architecture/userpreferances/user_preferances.dart';
import 'package:practice_clean_architecture/utils/network_util.dart';

import '../../../../constants/server_complete_urls.dart';
import '../../../../core/errors/exceptions/exceptions.dart';
import '../models/user_devices_model.dart';

abstract class UserDevicesRemoteDataSource {
  Future<UserDevicesModel> getAllUserDevices();
}

class UserDevicesRemoteDataSourceImplementation
    implements UserDevicesRemoteDataSource {
  final NetworkUtil _networkUtil = NetworkUtil();
  final String? _userId = UserSharedPreferences.getUserUniqueId();

  @override
  Future<UserDevicesModel> getAllUserDevices() async {
    try {
      return await _networkUtil.post(
        NEW_GET_ALL_DEVICES,
        body: {
          "user_id": _userId,
        },
      ).then((value) {
        return UserDevicesModel.fromJson(value);
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
