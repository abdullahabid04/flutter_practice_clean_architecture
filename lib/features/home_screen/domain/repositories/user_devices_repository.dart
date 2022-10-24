import 'package:dartz/dartz.dart';
import 'package:practice_clean_architecture/core/errors/failures/failures.dart';
import 'package:practice_clean_architecture/features/home_screen/domain/entities/user_devices.dart';

abstract class UserDevicesRepository {
  Future<Either<Failure, UserDevices>> getUserDevices();
}
