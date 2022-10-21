import 'package:shared_preferences/shared_preferences.dart';
import '../constants/user_constants.dart';

class UserSharedPreferences {
  static late final SharedPreferences _prefsInstance;

  static Future<SharedPreferences> init() async {
    _prefsInstance = await SharedPreferences.getInstance();
    return _prefsInstance;
  }

  static Future setLoggedInStatus(bool isLoggedIn) async =>
      await _prefsInstance.setBool(UserConstants.IS_LOGGED_IN, isLoggedIn);

  static Future setAccountCreatedStatus(bool isAccountCreated) async =>
      await _prefsInstance.setBool(
          UserConstants.IS_ACCOUNT_CREATED, isAccountCreated);

  static Future setVerifiedStatus(bool isVerified) async =>
      await _prefsInstance.setBool(UserConstants.IS_VERIFIED, isVerified);

  static Future setFirstRunStatus(bool isFirstRun) async =>
      await _prefsInstance.setBool(UserConstants.IS_FIRST_RUN, isFirstRun);

  static Future setUserId(int id) async =>
      await _prefsInstance.setInt(UserConstants.ID, id);

  static Future setUserUniqueId(String userId) async =>
      await _prefsInstance.setString(UserConstants.USER_ID, userId);

  static Future setUserName(String userName) async =>
      await _prefsInstance.setString(UserConstants.USER_NAME, userName);

  static Future setUserEmail(String eMail) async =>
      await _prefsInstance.setString(UserConstants.E_MAIL, eMail);

  static Future setUserMobileNo(String mobileNo) async =>
      await _prefsInstance.setString(UserConstants.CONTACT, mobileNo);

  static Future setUserAccountPassword(String password) async =>
      await _prefsInstance.setString(UserConstants.PASSWROD, password);

  static Future setUserCity(String password) async =>
      await _prefsInstance.setString(UserConstants.CITY, password);

  static Future setUserAddress(String address) async =>
      await _prefsInstance.setString(UserConstants.ADDRESS, address);

  static Future setUserCreatedDate(String dateCreated) async =>
      await _prefsInstance.setString(UserConstants.DATE_CREATED, dateCreated);

  static Future setUserProfileImagePath(String imagePath) async =>
      await _prefsInstance.setString(
          UserConstants.PROFILE_IMAGE_PATH, imagePath);

  static Future setUserHomesCount(int homeCount) async =>
      await _prefsInstance.setInt(UserConstants.HOME_COUNT, homeCount);

  static Future setUserRoomsCount(int roomCount) async =>
      await _prefsInstance.setInt(UserConstants.ROOM_COUNT, roomCount);

  static Future setUserDevicesCount(int deviceCount) async =>
      await _prefsInstance.setInt(UserConstants.DEVICE_COUNT, deviceCount);

  static bool? getLoggedIn() =>
      _prefsInstance.getBool(UserConstants.IS_LOGGED_IN);

  static bool? getAccountCreated() =>
      _prefsInstance.getBool(UserConstants.IS_ACCOUNT_CREATED);

  static bool? getAccountVerified() =>
      _prefsInstance.getBool(UserConstants.IS_VERIFIED);

  static bool? getFirstRun() =>
      _prefsInstance.getBool(UserConstants.IS_FIRST_RUN);

  static int? getUserId() => _prefsInstance.getInt(UserConstants.ID);

  static String? getUserUniqueId() =>
      _prefsInstance.getString(UserConstants.USER_ID);

  static String? getUserName() =>
      _prefsInstance.getString(UserConstants.USER_NAME);

  static String? getUserEmail() =>
      _prefsInstance.getString(UserConstants.E_MAIL);

  static String? getUserMobileNo() =>
      _prefsInstance.getString(UserConstants.CONTACT);

  static String? getUserAccountPassword() =>
      _prefsInstance.getString(UserConstants.PASSWROD);

  static String? getUserCity() => _prefsInstance.getString(UserConstants.CITY);

  static String? getUserAddress() =>
      _prefsInstance.getString(UserConstants.ADDRESS);

  static String? getUserCreatedDate() =>
      _prefsInstance.getString(UserConstants.DATE_CREATED);

  static String? getUserProfileImagePath() =>
      _prefsInstance.getString(UserConstants.PROFILE_IMAGE_PATH);

  static int? getUserHomesCount() =>
      _prefsInstance.getInt(UserConstants.HOME_COUNT);

  static int? getUserRoomsCount() =>
      _prefsInstance.getInt(UserConstants.ROOM_COUNT);

  static int? getUserDevicesCount() =>
      _prefsInstance.getInt(UserConstants.DEVICE_COUNT);
}
