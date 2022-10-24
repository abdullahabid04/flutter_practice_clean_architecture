import 'package:dartz/dartz.dart';
import 'package:practice_clean_architecture/core/errors/failures/failures.dart';
import 'package:practice_clean_architecture/features/home_screen/data/datasources/user_devices_remote_datasource.dart';
import 'package:practice_clean_architecture/features/home_screen/domain/entities/user_devices.dart';
import 'package:practice_clean_architecture/features/home_screen/domain/repositories/user_devices_repository.dart';

import '../../../../core/errors/exceptions/exceptions.dart';
import '../../../../core/network/network_info.dart';

class UserDevicesRepositoryImplementation implements UserDevicesRepository {
  final UserDevicesRemoteDataSource userDevicesRemoteDataSource;
  final NetworkInfo networkInfo;

  UserDevicesRepositoryImplementation(
    this.userDevicesRemoteDataSource,
    this.networkInfo,
  );

  @override
  Future<Either<Failure, UserDevices>> getUserDevices() async {
    if (await networkInfo.isConnected) {
      try {
        final userDevices =
            await userDevicesRemoteDataSource.getAllUserDevices();
        return Right(userDevices);
      } on ServerException catch (error) {
        return Left(ServerFailure());
      } on GenericException catch (error) {
        return Left(GenericFailure());
      } on Exception catch (error) {
        return Left(GenericFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }
}
