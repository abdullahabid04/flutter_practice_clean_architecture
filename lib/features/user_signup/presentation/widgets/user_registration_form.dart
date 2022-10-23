import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/colors.dart';
import '../../../../utils/change_focus_of_field.dart';
import '../../../../utils/check_platform.dart';
import '../../../../utils/show_dialog.dart';
import '../../../../validators/all_validators.dart';
import '../bloc/bloc.dart';

class UserRegisterForm extends StatefulWidget {
  const UserRegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _UserRegisterFormState();
  }
}

class _UserRegisterFormState extends State<UserRegisterForm> {
  bool _isLoading = false;
  bool _isLoadingValue = false;
  bool _autoValidate = false;
  late ShowDialog _showDialog;
  late CheckPlatform _checkPlatform;

  final _signupFormKey = GlobalKey<FormState>();
  late String _name, _email, _password, _address, _city, _contact;
  String _passwordValidText =
      "Password should contain at least one small and large alpha characters";

  final FocusNode _nameNode = FocusNode();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _addressNode = FocusNode();
  final FocusNode _cityNode = FocusNode();
  final FocusNode _contactNode = FocusNode();

  @override
  void initState() {
    _showDialog = ShowDialog();
    _checkPlatform = const CheckPlatform();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 15.0,
          ),
          Container(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _signupFormKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onSaved: (val) {
                      _name = val!;
                    },
                    autofocus: true,
                    focusNode: _nameNode,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    onFieldSubmitted: (val) {
                      fieldFocusChange(context, _nameNode, _emailNode);
                    },
                    validator: nameValidator,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                      prefixIcon: const Icon(
                        Icons.person,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 21.0,
                  ),
                  TextFormField(
                    onSaved: (val) {
                      _email = val!;
                    },
                    focusNode: _emailNode,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (val) {
                      fieldFocusChange(context, _emailNode, _passwordNode);
                    },
                    validator: emailValidator,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                      prefixIcon: const Icon(
                        Icons.email,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 21.0,
                  ),
                  TextFormField(
                    onSaved: (val) {
                      _password = val!;
                    },
                    validator: passwordValidator,
                    obscureText: true,
                    focusNode: _passwordNode,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (val) {
                      fieldFocusChange(context, _passwordNode, _addressNode);
                    },
                    decoration: InputDecoration(
                      hintText: 'Password',
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                      prefixIcon: const Icon(
                        Icons.lock_open,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      suffixIcon: Tooltip(
                        message: _passwordValidText,
                        padding: const EdgeInsets.all(20.0),
                        verticalOffset: 10.0,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () {},
                          child: Container(
                            child: const Text("?"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 21.0,
                  ),
                  TextFormField(
                    onSaved: (val) {
                      _address = val!;
                    },
                    focusNode: _addressNode,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.sentences,
                    onFieldSubmitted: (val) {
                      fieldFocusChange(context, _addressNode, _cityNode);
                    },
                    validator: addressValidator,
                    decoration: InputDecoration(
                      hintText: 'Address',
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                      prefixIcon: const Icon(
                        Icons.home,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 21.0,
                  ),
                  TextFormField(
                    onSaved: (val) {
                      _city = val!;
                    },
                    focusNode: _cityNode,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    onFieldSubmitted: (val) {
                      fieldFocusChange(context, _cityNode, _contactNode);
                    },
                    validator: cityValidator,
                    decoration: InputDecoration(
                      hintText: 'City',
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                      prefixIcon: const Icon(
                        Icons.location_city,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 21.0,
                  ),
                  TextFormField(
                    onSaved: (val) {
                      _contact = val!;
                    },
                    focusNode: _contactNode,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    onFieldSubmitted: (val) {
                      _contactNode.unfocus();
                    },
                    validator: contactValidator,
                    decoration: InputDecoration(
                      hintText: 'Contact',
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                      prefixIcon: const Icon(
                        Icons.phone,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 21.0,
                  ),
                  Container(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      color: kHAutoBlue300,
                      onPressed: () => _createUserAccount(),
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        child: const Text(
                          'Signup',
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'AlReady have an account? Login',
                        style: TextStyle(color: kHAutoBlue50),
                        textScaleFactor: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _createUserAccount() async {
    final form = _signupFormKey.currentState;
    if (form!.validate()) {
      form.save();
      BlocProvider.of<UserSignUpBloc>(context).add(
        CreateUserAccount(
          _name,
          _email,
          _password,
          _contact,
          _city,
          _address,
        ),
      );
    }
  }
}
