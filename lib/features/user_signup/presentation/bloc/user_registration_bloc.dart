import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_clean_architecture/core/errors/failure_utils/map_failure_to_message.dart';
import 'package:practice_clean_architecture/features/user_signup/domain/usecases/get_user_account_verification.dart';
import 'package:practice_clean_architecture/features/user_signup/domain/usecases/get_user_sign_up.dart';
import 'user_registration_state.dart';
import 'user_registration_event.dart';

class UserSignUpBloc extends Bloc<UserSignUpEvent, UserSignUpState> {
  final GetUserSignUp getUserSignUp;
  final GetUserAccountVerification getUserAccountVerification;

  UserSignUpBloc({
    GetUserSignUp? getUserSignUp,
    GetUserAccountVerification? getUserAccountVerification,
  })  : assert(getUserSignUp != null),
        assert(getUserAccountVerification != null),
        getUserSignUp = getUserSignUp!,
        getUserAccountVerification = getUserAccountVerification!,
        super(const UserSignUpInitialState()) {
    on<CreateUserAccount>((event, emit) async {
      emit(const UserSignUpLoadingState());
      final userSignUp = await getUserSignUp(
        UserSignUpParams(
          event.userName,
          event.eMail,
          event.password,
          event.address,
          event.city,
          event.mobileNo,
        ),
      );
      emit(UserSignUpAccountNotCreatedState());
      userSignUp.fold(
        (failure) => emit(
          UserSignUpErrorState(
            title: mapFailureToMessage(failure)[0],
            message: mapFailureToMessage(failure)[1],
          ),
        ),
        (success) => emit(
          UserSignUpAccountCreatedState(
            userSignUp: success,
          ),
        ),
      );
      emit(UserSignUpLoadingState());
    });
    on<VerifyUserAccount>((event, emit) async {
      emit(UserSignUpLoadingState());
      final userVerifyAccount = await getUserAccountVerification(
        UserAccountVerifyParams(
          event.userId,
          event.verificationCode,
        ),
      );
      emit(UserSignUpAccountNotVerifiedState());
      userVerifyAccount.fold(
        (failure) => emit(
          UserSignUpAccountNotVerifiedState(),
        ),
        (success) => emit(
          UserSignUpAccountVerifiedState(),
        ),
      );
    });
  }
}
