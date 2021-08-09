import 'package:example/src/app/pages/login/widgets/body.dart';
import 'package:example/src/data/repositories/data_users_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'login_controller.dart';

class LoginPage extends View {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ViewState<LoginPage, LoginController> {
  _LoginPageState() : super(LoginController(DataUsersRepository()));

  @override
  Widget get view {
    return  Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text("Sign in"),
      ),
      body: Body(),
    );
  }
}