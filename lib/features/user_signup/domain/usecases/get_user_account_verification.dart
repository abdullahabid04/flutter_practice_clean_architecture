import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_clean_architecture/core/errors/failures/failures.dart';
import 'package:practice_clean_architecture/core/usecase/usecase.dart';
import 'package:practice_clean_architecture/features/user_signup/domain/entities/user_account_verification.dart';
import 'package:practice_clean_architecture/features/user_signup/domain/repositories/get_user_registration_repository.dart';

class GetUserAccountVerification
    implements UseCase<UserAccountVerification, Params> {
  GetUserRegistrationRepository getUserRegistrationRepository;

  GetUserAccountVerification(this.getUserRegistrationRepository);

  @override
  Future<Either<Failure, UserAccountVerification>> call(Params params) async {
    return await getUserRegistrationRepository.getUserAccountVerification(
      params.userId,
      params.verificationCode,
    );
  }
}

class Params extends Equatable {
  final String userId;
  final String verificationCode;

  const Params(
    this.userId,
    this.verificationCode,
  );

  @override
  List<Object?> get props => [
        userId,
        verificationCode,
      ];
}
