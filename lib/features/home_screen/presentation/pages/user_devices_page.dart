import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_clean_architecture/dependancy_injection.dart';
import 'package:practice_clean_architecture/features/home_screen/presentation/widgets/device_widget.dart';
import 'package:practice_clean_architecture/utils/show_progress.dart';
import '../bloc/bloc.dart';

class UserDeviceScreen extends StatefulWidget {
  const UserDeviceScreen({Key? key}) : super(key: key);

  @override
  State<UserDeviceScreen> createState() => _UserDeviceScreenState();
}

class _UserDeviceScreenState extends State<UserDeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildUserDevicesPage(context),
    );
  }

  BlocProvider<UserDevicesBloc> _buildUserDevicesPage(BuildContext context) {
    return BlocProvider(
      create: (_) => getItServiceLocator<UserDevicesBloc>(),
      child: BlocConsumer<UserDevicesBloc, UserDevicesState>(
        listener: (context, state) {
          if (state is UserDevicesInitialState) {
            BlocProvider.of<UserDevicesBloc>(context).add(
              GetAllUserDevicesEvent(),
            );
          }
        },
        builder: (context, state) {
          if (state is UserDevicesLoadingState) {
            return ShowProgress();
          } else if (state is UserDevicesNotLoadedState) {
            return Container();
          } else if (state is UserDevicesLoadedState) {
            return DeviceWidget(
              userDevices: state.userDevices,
            );
          } else if (state is UserDevicesErrorState) {
            return Container();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
