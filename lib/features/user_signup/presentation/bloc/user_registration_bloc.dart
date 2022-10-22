import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    on<CreateUserAccount>((event, emit) {});
    on<VerifyUserAccount>((event, emit) {});
  }
}
