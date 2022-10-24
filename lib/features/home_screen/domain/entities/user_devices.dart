import 'package:equatable/equatable.dart';

class UserDevices extends Equatable {
  final int? status;
  final String? message;
  final int? totaldevices;
  final int? totalinfo;
  final List<DevicesData>? devices;
  final List<InfoData>? info;

  UserDevices({
    required this.status,
    required this.message,
    required this.totaldevices,
    required this.totalinfo,
    required this.devices,
    required this.info,
  });

  @override
  List<Object?> get props => [
        status,
        message,
        totaldevices,
        totalinfo,
        devices,
        info,
      ];
}

class DevicesData extends Equatable {
  final String? id;
  final String? userId;
  final String? homeId;
  final String? roomId;
  final String? deviceId;
  final String? deviceName;
  final String? deviceType;
  final String? dateCreated;

  DevicesData({
    required this.id,
    required this.userId,
    required this.homeId,
    required this.roomId,
    required this.deviceId,
    required this.deviceName,
    required this.deviceType,
    required this.dateCreated,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        homeId,
        roomId,
        deviceId,
        deviceName,
        deviceType,
        dateCreated,
      ];
}

class InfoData extends Equatable {
  final String? id;
  final String? userId;
  final String? homeId;
  final String? roomId;
  final String? userRole;
  final String? shared;
  final String? deviceId;
  final String? deviceName;
  final String? active;

  InfoData({
    required this.id,
    required this.userId,
    required this.homeId,
    required this.roomId,
    required this.userRole,
    required this.shared,
    required this.deviceId,
    required this.deviceName,
    required this.active,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        homeId,
        roomId,
        userRole,
        shared,
        deviceId,
        deviceName,
        active,
      ];
}
