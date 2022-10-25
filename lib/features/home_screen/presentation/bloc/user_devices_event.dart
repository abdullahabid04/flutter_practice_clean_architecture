import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class UserDevicesEvent extends Equatable {
  const UserDevicesEvent();

  @override
  List<Object> get props => [];
}

@immutable
class GetAllUserDevicesEvent implements UserDevicesEvent {
  const GetAllUserDevicesEvent();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}
