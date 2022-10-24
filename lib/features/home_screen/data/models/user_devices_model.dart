import 'package:practice_clean_architecture/features/home_screen/domain/entities/user_devices.dart';
import 'package:practice_clean_architecture/utils/convert_json_to_object.dart';

class UserDevicesModel extends UserDevices {
  int? status;
  String? message;
  int? totaldevices;
  int? totalinfo;
  List<Devices>? devices;
  List<Info>? info;

  UserDevicesModel({
    this.status,
    this.message,
    this.totaldevices,
    this.totalinfo,
    this.devices,
    this.info,
  }) : super(
          status: status,
          message: message,
          totaldevices: totaldevices,
          totalinfo: totalinfo,
          devices: devices,
          info: info,
        );

  factory UserDevicesModel.fromJson(Map<String, dynamic> json) {
    return UserDevicesModel(
      status: json['status'],
      message: json['message'],
      totaldevices: json['totaldevices'],
      totalinfo: json['totalinfo'],
      devices: List.from(json['devices'])
          .map<Devices>((device) => Devices.fromJson(device))
          .toList(),
      info: List.from(json['info'])
          .map<Info>((info) => Info.fromJson(info))
          .toList(),
      // devices: convertJsonToObject(json['devices'], Devices),
      // info: convertJsonToObject(json['info'], Info),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['totaldevices'] = this.totaldevices;
    data['totalinfo'] = this.totalinfo;
    if (this.devices != null) {
      data['devices'] = this.devices!.map((v) => v.toJson()).toList();
    }
    if (this.info != null) {
      data['info'] = this.info!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Devices extends DevicesData {
  String? id;
  String? userId;
  String? homeId;
  String? roomId;
  String? deviceId;
  String? deviceName;
  String? deviceType;
  String? dateCreated;

  Devices({
    this.id,
    this.userId,
    this.homeId,
    this.roomId,
    this.deviceId,
    this.deviceName,
    this.deviceType,
    this.dateCreated,
  }) : super(
          id: id,
          userId: userId,
          homeId: homeId,
          roomId: roomId,
          deviceId: deviceId,
          deviceName: deviceName,
          deviceType: deviceType,
          dateCreated: dateCreated,
        );

  factory Devices.fromJson(Map<String, dynamic> json) {
    return Devices(
      id: json['id'],
      userId: json['user_id'],
      homeId: json['home_id'],
      roomId: json['room_id'],
      deviceId: json['device_id'],
      deviceName: json['device_name'],
      deviceType: json['device_type'],
      dateCreated: json['date_created'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['home_id'] = this.homeId;
    data['room_id'] = this.roomId;
    data['device_id'] = this.deviceId;
    data['device_name'] = this.deviceName;
    data['device_type'] = this.deviceType;
    data['date_created'] = this.dateCreated;
    return data;
  }
}

class Info extends InfoData {
  String? id;
  String? userId;
  String? homeId;
  String? roomId;
  String? userRole;
  String? shared;
  String? deviceId;
  String? deviceName;
  String? active;

  Info({
    this.id,
    this.userId,
    this.homeId,
    this.roomId,
    this.userRole,
    this.shared,
    this.deviceId,
    this.deviceName,
    this.active,
  }) : super(
          id: id,
          userId: userId,
          homeId: homeId,
          roomId: roomId,
          userRole: userRole,
          shared: shared,
          deviceId: deviceId,
          deviceName: deviceName,
          active: active,
        );

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      id: json['id'],
      userId: json['user_id'],
      homeId: json['home_id'],
      roomId: json['room_id'],
      userRole: json['user_role'],
      shared: json['shared'],
      deviceId: json['device_id'],
      deviceName: json['device_name'],
      active: json['active'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['home_id'] = this.homeId;
    data['room_id'] = this.roomId;
    data['user_role'] = this.userRole;
    data['shared'] = this.shared;
    data['device_id'] = this.deviceId;
    data['device_name'] = this.deviceName;
    data['active'] = this.active;
    return data;
  }
}
