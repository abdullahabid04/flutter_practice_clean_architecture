import 'package:dartz/dartz.dart';
import 'package:practice_clean_architecture/core/errors/exceptions/exceptions.dart';
import 'package:practice_clean_architecture/core/errors/failures/failures.dart';
import 'package:practice_clean_architecture/core/network/network_info.dart';
import 'package:practice_clean_architecture/features/user_login/data/datasources/user_login_local_data_source.dart';
import 'package:practice_clean_architecture/features/user_login/data/datasources/user_login_remote_data_source.dart';
import 'package:practice_clean_architecture/features/user_login/domain/entities/user_login.dart';
import 'package:practice_clean_architecture/features/user_login/domain/repositories/user_login_repository.dart';

class UserLoginRepositoryImplementation implements UserLoginRepository {
  final UserLoginRemoteDataSource userLoginRemoteDataSource;
  final UserLoginLocalDataSource userLoginLocalDataSource;
  final NetworkInfo networkInfo;

  UserLoginRepositoryImplementation({
    required this.userLoginRemoteDataSource,
    required this.userLoginLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserLogin>> getUserLogin(
      String mobileNo, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final userLogin =
            await userLoginRemoteDataSource.getUserLogin(mobileNo, password);
        return Right(userLogin);
      } on ServerException catch (error) {
        return Left(ServerFailure());
      } on GenericException catch (error) {
        return Left(GenericFailure());
      } on Exception catch (error) {
        return Left(GenericFailure());
      }
    } else {
      try {
        final userLogin =
            await userLoginLocalDataSource.getUserLogin(mobileNo, password);
        return Right(userLogin);
      } on InvalidCredentialsException catch (error) {
        return Left(InvalidCredentialsFailure());
      }
    }
  }
}
