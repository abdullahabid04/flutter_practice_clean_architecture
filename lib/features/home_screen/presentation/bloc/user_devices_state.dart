import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:practice_clean_architecture/features/home_screen/domain/entities/user_devices.dart';

@immutable
abstract class UserDevicesState extends Equatable {
  const UserDevicesState();

  @override
  List<Object> get props => [];
}

@immutable
class UserDevicesInitialState implements UserDevicesState {
  const UserDevicesInitialState();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

@immutable
class UserDevicesLoadingState implements UserDevicesState {
  const UserDevicesLoadingState();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

@immutable
class UserDevicesLoadedState implements UserDevicesState {
  final UserDevices userDevices;

  const UserDevicesLoadedState({
    required this.userDevices,
  });

  @override
  List<Object> get props => [
        userDevices,
      ];

  @override
  bool? get stringify => true;
}

@immutable
class UserDevicesNotLoadedState implements UserDevicesState {
  const UserDevicesNotLoadedState();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

@immutable
class UserDevicesErrorState implements UserDevicesState {
  final String title;
  final String message;

  const UserDevicesErrorState({
    required this.title,
    required this.message,
  });

  @override
  List<Object> get props => [
        title,
        message,
      ];

  @override
  bool? get stringify => true;
}
