import '../../../domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'login_presenter.dart';

class LoginController extends Controller {
  User _user;
  User get user => _user; // data used by the View
  final LoginPresenter loginPresenter;
  BuildContext context;
  // Presenter should always be initialized this way

  LoginController(usersRepo)
      : loginPresenter = LoginPresenter(usersRepo),
        super();

  @override
  // this is called automatically by the parent class
  void initListeners() {
    loginPresenter.getUserOnNext = (User user) {
      print(user.toString());
      _user = user;
      refreshUI(); // Refreshes the UI manually
    };
    loginPresenter.getUserOnComplete = () {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
          user.name + "Of Age " + user.age.toString(),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ));
      print('User retrieved');
    };

    // On error, show a snackbar, remove the user, and refresh the UI
    loginPresenter.getUserOnError = (e) {
      print('Could not retrieve user.');
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(e.message),
        backgroundColor: Colors.red,
      ));
      _user = null;
      refreshUI(); // Refreshes the UI manually
    };
  }

  void getUser(password, email, context) {
    loginPresenter.getUser(password, email);
    this.context = context;
  }

  @override
  void onInitState() {
    super.onInitState();
  }

  @override
  void onResumed() => print('On resumed');

  @override
  void onReassembled() => print('View is about to be reassembled');

  @override
  void onDeactivated() => print('View is about to be deactivated');

  @override
  void onDisposed() {
    loginPresenter.dispose(); // don't forget to dispose of the presenter
    super.onDisposed();
  }
}
