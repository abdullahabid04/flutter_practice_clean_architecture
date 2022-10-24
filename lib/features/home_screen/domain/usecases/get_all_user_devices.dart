import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_clean_architecture/core/errors/failures/failures.dart';
import 'package:practice_clean_architecture/core/usecase/usecase.dart';
import 'package:practice_clean_architecture/features/home_screen/domain/entities/user_devices.dart';
import 'package:practice_clean_architecture/features/home_screen/domain/repositories/user_devices_repository.dart';

class GetAllUserDevices implements UseCase<UserDevices, UserDevicesParams> {
  final UserDevicesRepository userDevicesRepository;

  GetAllUserDevices(this.userDevicesRepository);

  @override
  Future<Either<Failure, UserDevices>> call(UserDevicesParams params) async {
    return await userDevicesRepository.getUserDevices();
  }
}

class UserDevicesParams extends Equatable {
  UserDevicesParams();

  @override
  List<Object?> get props => [];
}
