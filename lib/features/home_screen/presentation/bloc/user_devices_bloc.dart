import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_clean_architecture/core/errors/failure_utils/map_failure_to_message.dart';
import 'package:practice_clean_architecture/features/home_screen/presentation/bloc/user_devices_event.dart';
import 'package:practice_clean_architecture/features/home_screen/presentation/bloc/user_devices_state.dart';

import '../../domain/usecases/get_all_user_devices.dart';

class UserDevicesBloc extends Bloc<UserDevicesEvent, UserDevicesState> {
  final GetAllUserDevices getAllUserDevices;

  UserDevicesBloc(GetAllUserDevices? getAllUserDevices)
      : assert(getAllUserDevices != null),
        getAllUserDevices = getAllUserDevices!,
        super(UserDevicesInitialState()) {
    on<GetAllUserDevicesEvent>((event, emit) async {
      emit(UserDevicesLoadingState());
      final userDevices = await getAllUserDevices(UserDevicesParams());
      emit(UserDevicesNotLoadedState());
      userDevices.fold(
        (failure) => UserDevicesErrorState(
          title: mapFailureToMessage(failure)[0],
          message: mapFailureToMessage(failure)[1],
        ),
        (success) => UserDevicesLoadedState(
          userDevices: success,
        ),
      );
    });
  }
}
