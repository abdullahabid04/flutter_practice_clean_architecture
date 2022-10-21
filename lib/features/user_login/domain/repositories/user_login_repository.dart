import 'package:dartz/dartz.dart';
import 'package:practice_clean_architecture/features/user_login/domain/entities/user_login.dart';

import '../../../../core/errors/failures/failures.dart';

abstract class UserLoginRepository {
  Future<Either<Failure, UserLogin>> getUserLogin(String mobileNo, String password);
}
