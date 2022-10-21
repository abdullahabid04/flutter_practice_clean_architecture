import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_clean_architecture/dependancy_injection.dart';
import '/utils/show_progress.dart';
import '../bloc/bloc.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("L O G I N"),
      ),
      body: _buildLoginPage(context),
    );
  }

  BlocProvider<UserLoginBloc> _buildLoginPage(BuildContext context) {
    return BlocProvider(
      create: (_) => getItServiceLocator<UserLoginBloc>(),
      child: BlocBuilder<UserLoginBloc, UserLoginState>(
        builder: (context, state) {
          if (state is UserLoginEmptyState) {
            return LoginForm();
          } else if (state is UserLoginLoadingState) {
            return ShowProgress();
          } else if (state is UserLoginLoadedState) {
            return LoginForm();
          } else if (state is UserLoginErrorState) {
            return LoginForm();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
