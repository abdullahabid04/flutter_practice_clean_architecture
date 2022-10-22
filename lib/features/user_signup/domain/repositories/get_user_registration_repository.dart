import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures/failures.dart';
import '../entities/user_account_verification.dart';
import '../entities/user_signup.dart';

abstract class GetUserRegistrationRepository {
  Future<Either<Failure, UserSignUp>> getUserSignUp(
    String userName,
    String eMail,
    String password,
    String address,
    String city,
    String mobileNo,
  );

  Future<Either<Failure, UserAccountVerification>> getUserAccountVerification(
    String userId,
    String verificationCode,
  );
}
