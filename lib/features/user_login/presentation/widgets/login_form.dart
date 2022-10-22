import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/validators/all_validators.dart';
import '/utils/change_focus_of_field.dart';
import '/constants/colors.dart';
import '/utils/internet_access.dart';
import '/utils/show_dialog.dart';
import '../bloc/bloc.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;
  bool _isLoadingValue = false;
  bool _isLoading = true;
  final _loginFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late String _password, _contact;
  final bool _autoValidate = false;
  final TextEditingController _contactController = TextEditingController();
  late TextEditingValue _contactValue;
  late final TextEditingController _passwordController =
      TextEditingController();
  late TextEditingValue _passwordValue;
  final FocusNode _contactNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  late String _userContact;
  late String _userPassword;
  late CheckInternetAccess _checkInternetAccess;
  late ShowDialog _showDialog;

  @override
  void initState() {
    _checkInternetAccess = CheckInternetAccess();
    _showDialog = ShowDialog();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const Center(
          child: Text(
            "Home Automation",
            textScaleFactor: 2.0,
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/logo.png",
                height: 200.0,
              ),
              Container(
                child: const Text(
                  "Home Automation",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: "Raleway",
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 41.0,
        ),
        Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _loginFormKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _contactController,
                  autofocus: true,
                  onSaved: (val) => _contact = val!,
                  validator: contactValidator,
                  focusNode: _contactNode,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (val) {
                    fieldFocusChange(context, _contactNode, _passwordNode);
                  },
                  decoration: InputDecoration(
                    hintText: "Mobile No",
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                    prefixIcon: const Icon(
                      Icons.person_outline,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: _passwordController,
                        onSaved: (val) => _password = val!,
                        validator: validatePassword,
                        focusNode: _passwordNode,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (val) {
                          _passwordNode.unfocus();
                        },
                        decoration: InputDecoration(
                          hintText: "Password",
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock_open,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () => setState(() {
                              _obscureText = !_obscureText;
                            }),
                          ),
                        ),
                        obscureText: _obscureText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Center(
          child: Container(
            child: ElevatedButton(
              onPressed: () => _submit(),
              child: Container(
                margin: const EdgeInsets.all(15.0),
                child: const Text("LOGIN"),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: TextButton(
            onPressed: () => {},
            child: Text(
              'Don\'t have an account? Register',
              textScaleFactor: 1,
              style: TextStyle(
                color: kHAutoBlue50,
              ),
            ),
          ),
        )
      ],
    );
  }

  void _submit() async {
    final form = _loginFormKey.currentState;
    if (form!.validate()) {
      form.save();
      BlocProvider.of<UserLoginBloc>(context).add(
        GetUserLoginEvent(
          _contact,
          _password,
        ),
      );
    }
  }
}
