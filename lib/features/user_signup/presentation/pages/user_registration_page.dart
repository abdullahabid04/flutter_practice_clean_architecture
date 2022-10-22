import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_clean_architecture/dependancy_injection.dart';

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
    );
  }

  BlocProvider<UserSignUpBloc> _buildSignUpPage(BuildContext context) {
    return BlocProvider(
      create: (_) => getItServiceLocator<UserSignUpBloc>(),
      child: BlocBuilder<UserSignUpBloc, UserSignUpState>(
        builder: (context, state) {
          if (state is UserSignUpInitialState) {
            return UserRegisterForm();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
