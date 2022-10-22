import 'package:dartz/dartz.dart';
import 'package:practice_clean_architecture/core/errors/failures/failures.dart';
import 'package:practice_clean_architecture/features/user_signup/domain/entities/user_account_verification.dart';
import 'package:practice_clean_architecture/features/user_signup/domain/entities/user_signup.dart';
import 'package:practice_clean_architecture/features/user_signup/domain/repositories/get_user_registration_repository.dart';

import '../../../../core/errors/exceptions/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/user_account_verification_remote_datasource.dart';
import '../datasources/user_signup_remote_datasource.dart';

class GetUserRegistrationRepositoryImplementation
    implements GetUserRegistrationRepository {
  final UserSignUpRemoteDataSource userSignUpRemoteDataSource;
  final UserAccountVerificationRemoteDataSource
      userAccountVerificationRemoteDataSource;
  final NetworkInfo networkInfo;

  GetUserRegistrationRepositoryImplementation({
    required this.userSignUpRemoteDataSource,
    required this.userAccountVerificationRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserAccountVerification>> getUserAccountVerification(
    String userId,
    String verificationCode,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final userAccountVerification =
            await userAccountVerificationRemoteDataSource
                .getUSerAccountVerification(
          userId,
          verificationCode,
        );
        return Right(userAccountVerification);
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

  @override
  Future<Either<Failure, UserSignUp>> getUserSignUp(
    String userName,
    String eMail,
    String password,
    String address,
    String city,
    String mobileNo,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final userSignUp = await userSignUpRemoteDataSource.getUserSignUp(
          userName,
          eMail,
          password,
          address,
          city,
          mobileNo,
        );
        return Right(userSignUp);
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
