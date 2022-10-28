import 'package:flutter/material.dart';
import 'package:practice_clean_architecture/features/home_screen/domain/entities/user_devices.dart';

import '../../../../constants/colors.dart';

class DeviceWidget extends StatefulWidget {
  final UserDevices userDevices;

  const DeviceWidget({
    Key? key,
    required this.userDevices,
  }) : super(key: key);

  @override
  State<DeviceWidget> createState() => _DeviceWidgetState();
}

class _DeviceWidgetState extends State<DeviceWidget> {
  @override
  Widget build(BuildContext context) {
    return _createDevicesListView(
      context,
      widget.userDevices.devices!,
      widget.userDevices.info!,
    );
  }

  Widget _createDevicesListView(
    BuildContext context,
    List<DevicesData> listDevicesData,
    List<InfoData> listDeviceInfo,
  ) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: listDevicesData.length == listDeviceInfo.length
          ? listDevicesData.length
          : 0,
      itemBuilder: ((context, index) => _createDeviceItemWidget(
            context,
            listDevicesData,
            listDeviceInfo,
            index,
          )),
    );
  }

  Widget _createDeviceItemWidget(
    BuildContext context,
    List<DevicesData> deviceDataList,
    List<InfoData> deviceInfoList,
    int index,
  ) {
    return _createDeviceWidget(
      context,
      deviceDataList[index],
      deviceInfoList[index],
    );
  }

  Widget _createDeviceWidget(
    BuildContext context,
    DevicesData devicesData,
    InfoData infoData,
  ) {
    return Container(
      child: InkWell(
        onTap: () => {},
        splashColor: kHAutoBlue300,
        child: Container(
          padding: const EdgeInsets.only(
              left: 10.0, top: 20.0, bottom: 20.0, right: 10.0),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: infoData.active == "1"
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Switch(
                            focusColor: Colors.white,
                            hoverColor: Colors.black,
                            activeColor: Colors.green,
                            activeTrackColor: Colors.blue,
                            inactiveThumbColor: Colors.red,
                            inactiveTrackColor: Colors.yellow,
                            value: true,
                            onChanged: (bool value) {
                              // setState(() {
                              //   _changeState[device.deviceId!] = true;
                              //   info.active = value == true ? "1" : "0";
                              // });
                              // _powerDevice(device.userId!, device.deviceId!,
                              //     value == true ? "on" : "off");
                            },
                            autofocus: true,
                            splashRadius: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                  child: Divider(
                    color: Colors.blueAccent,
                    thickness: 1.0,
                    indent: 5.0,
                    endIndent: 5.0,
                    height: 1.0,
                  ),
                ),
                Expanded(
                  child: Row(children: [
                    Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 1.0, bottom: 1.0),
                            child: Column(
                              children: [
                                Hero(
                                  tag: Object(),
                                  child: Text(
                                    "${devicesData.deviceName}",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(fontSize: 15.0),
                                  ),
                                ),
                                Text(
                                  "${devicesData.deviceType}",
                                  style: const TextStyle(
                                    fontSize: 10.0,
                                  ),
                                ),
                              ],
                            ))),
                  ]),
                ),
                const SizedBox(
                  height: 10.0,
                  child: Divider(
                    color: Colors.blueAccent,
                    thickness: 1.0,
                    indent: 5.0,
                    endIndent: 5.0,
                    height: 1.0,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () async {
                              // _showDeviceNameDialog(device, info);
                            },
                            child: const Icon(Icons.info),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () async {
                              // await _showHomeReNameDialog(device);
                            },
                            child: const Icon(Icons.edit),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () async {
                              // await _deleteDevice(device);
                            },
                            child: const Icon(Icons.delete),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () async {
                              // _showDeviceShareDialog(device);
                            },
                            child: const Icon(Icons.share),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
