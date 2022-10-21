import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:practice_clean_architecture/core/network/network_info.dart';
import 'package:practice_clean_architecture/features/user_login/data/datasources/user_login_local_data_source.dart';
import 'package:practice_clean_architecture/features/user_login/data/datasources/user_login_remote_data_source.dart';
import 'package:practice_clean_architecture/features/user_login/data/repositories/user_login_repository_implementation.dart';
import 'package:practice_clean_architecture/features/user_login/domain/repositories/user_login_repository.dart';
import 'package:practice_clean_architecture/features/user_login/domain/usecases/get_user_login.dart';
import 'package:practice_clean_architecture/features/user_login/presentation/bloc/bloc.dart';
import 'package:practice_clean_architecture/userpreferances/local_user_data.dart';

final getItServiceLocator = GetIt.instance;

Future<void> init() async {
  getItServiceLocator.registerFactory(
    () => UserLoginBloc(
      getUserLogin: getItServiceLocator(),
    ),
  );
  getItServiceLocator.registerLazySingleton(
    () => GetUserLogin(
      getItServiceLocator(),
    ),
  );
  getItServiceLocator.registerLazySingleton<UserLoginRepository>(
    () => UserLoginRepositoryImplementation(
      userLoginRemoteDataSource: getItServiceLocator(),
      userLoginLocalDataSource: getItServiceLocator(),
      networkInfo: getItServiceLocator(),
    ),
  );
  getItServiceLocator.registerLazySingleton<UserLoginRemoteDataSource>(
    () => UserLoginRemoteDataSourceImplementation(),
  );
  getItServiceLocator.registerLazySingleton<UserLoginLocalDataSource>(
    () => UserLoginLocalDataSourceImplementation(
      localUserData: getItServiceLocator(),
    ),
  );
  getItServiceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImplementation(
      getItServiceLocator(),
    ),
  );
  getItServiceLocator.registerLazySingleton<LocalUserData>(
    () => LocalUserDataImplementation(),
  );
  getItServiceLocator.registerLazySingleton(
    () => InternetConnectionChecker(),
  );
}
