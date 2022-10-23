import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_clean_architecture/dependancy_injection.dart';
import 'package:practice_clean_architecture/utils/show_progress.dart';

import '../bloc/bloc.dart';
import '../widgets/user_registration_form.dart';

class UserSignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserSignUpPageState();
  }
}

class _UserSignUpPageState extends State<UserSignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign Up",
        ),
      ),
      body: _buildSignUpPage(context),
    );
  }

  BlocProvider<UserSignUpBloc> _buildSignUpPage(BuildContext context) {
    return BlocProvider(
      create: (_) => getItServiceLocator<UserSignUpBloc>(),
      child: BlocConsumer<UserSignUpBloc, UserSignUpState>(
        listener: (context, state) {
          if (state is UserSignUpAccountVerifiedState) {
            Navigator.of(context).pop();
          } else if (state is UserSignUpAccountCreatedState) {
            BlocProvider.of<UserSignUpBloc>(context).add(
              VerifyUserAccount(
                state.userSignUp.userId!,
                state.userSignUp.code.toString(),
              ),
            );
          } else {}
        },
        builder: (context, state) {
          if (state is UserSignUpInitialState) {
            return UserRegisterForm();
          } else if (state is UserSignUpLoadingState) {
            return ShowProgress();
            // } else if (state is UserSignUpAccountCreatedState) {
            //   return ShowProgress();
          } else if (state is UserSignUpAccountNotCreatedState) {
            return UserRegisterForm();
          } else if (state is UserSignUpErrorState) {
            return UserRegisterForm();
          } else if (state is UserSignUpAccountNotVerifiedState) {
            return UserRegisterForm();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
