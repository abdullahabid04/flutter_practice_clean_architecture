import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_clean_architecture/core/errors/failure_utils/map_failure_to_message.dart';
import 'package:practice_clean_architecture/features/user_login/domain/usecases/get_user_login.dart';
import 'package:practice_clean_architecture/features/user_login/presentation/bloc/bloc.dart';

class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  GetUserLogin getUserLogin;

  UserLoginBloc({GetUserLogin? getUserLogin})
      : assert(getUserLogin != null),
        getUserLogin = getUserLogin!,
        super(const UserLoginEmptyState()) {
    on<GetUserLoginEvent>((event, emit) async {
      emit(const UserLoginLoadingState());
      final login = await getUserLogin(
        Params(
          event.mobileNo,
          event.password,
        ),
      );
      login.fold(
        (failure) => emit(
          UserLoginErrorState(
            title: mapFailureToMessage(failure)[0],
            message: mapFailureToMessage(failure)[1],
          ),
        ),
        (success) => emit(
          UserLoginLoadedState(
            userLogin: success,
          ),
        ),
      );
    });
  }
}
