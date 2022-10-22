import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_clean_architecture/core/errors/failures/failures.dart';
import 'package:practice_clean_architecture/core/usecase/usecase.dart';
import 'package:practice_clean_architecture/features/user_signup/domain/entities/user_signup.dart';
import 'package:practice_clean_architecture/features/user_signup/domain/repositories/get_user_registration_repository.dart';

class GetUserSignUp implements UseCase<UserSignUp, Params> {
  final GetUserRegistrationRepository getUserRegistrationRepository;

  GetUserSignUp(this.getUserRegistrationRepository);

  @override
  Future<Either<Failure, UserSignUp>> call(Params params) async {
    return await getUserRegistrationRepository.getUserSignUp(
      params.userName,
      params.eMail,
      params.password,
      params.address,
      params.city,
      params.mobileNo,
    );
  }
}

class Params extends Equatable {
  final String userName;
  final String eMail;
  final String password;
  final String address;
  final String city;
  final String mobileNo;

  const Params(
    this.userName,
    this.eMail,
    this.password,
    this.address,
    this.city,
    this.mobileNo,
  );

  @override
  List<Object?> get props => [
        userName,
        eMail,
        password,
        address,
        city,
        mobileNo,
      ];
}
