import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_clean_architecture/core/errors/failures/failures.dart';
import 'package:practice_clean_architecture/core/usecase/usecase.dart';
import 'package:practice_clean_architecture/features/user_login/domain/entities/user_login.dart';
import 'package:practice_clean_architecture/features/user_login/domain/repositories/user_login_repository.dart';

class GetUserLogin implements UseCase<UserLogin, UserLoginParams> {
  final UserLoginRepository userLoginRepository;

  GetUserLogin(this.userLoginRepository);

  @override
  Future<Either<Failure, UserLogin>> call(UserLoginParams params) async {
    return await userLoginRepository.getUserLogin(params.mobileNo, params.password);
  }

}

class UserLoginParams extends Equatable {
  final String mobileNo;
  final String password;

  const UserLoginParams(this.mobileNo, this.password);

  @override
  List<Object?> get props => [mobileNo, password];
}
