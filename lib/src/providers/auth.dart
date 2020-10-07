import 'package:flutter/material.dart';

import '../../flutter_login.dart';
import '../models/login_data.dart';

enum AuthMode { Signup, Login }

/// The result is an error message, callback successes if message is null
typedef AuthCallback = Future<String> Function(LoginData);

/// The result is an error message, callback successes if message is null
typedef AccountConfirmationCallback = Future<String> Function(LoginData);

/// The result is an error message, callback successes if message is null
typedef ProviderAuthCallback = Future<String> Function();

/// The result is an error message, callback successes if message is null
typedef RecoverCallback = Future<String> Function(String);

class Auth with ChangeNotifier {
  Auth({
    this.loginProvidersList,
    this.onLogin,
    this.onSignup,
    this.onRecoverPassword,
    this.onAccountConfirmation,
    String email = '',
    String password = '',
    String confirmPassword = '',
    String confirmationCode = '',
  })  : this._email = email,
        this._password = password,
        this._confirmPassword = confirmPassword,
        this._confirmationCode = confirmationCode;

  final AuthCallback onLogin;
  final AuthCallback onSignup;
  final RecoverCallback onRecoverPassword;
  final AccountConfirmationCallback onAccountConfirmation;
  final List<LoginProvider> loginProvidersList;

  AuthMode _mode = AuthMode.Login;

  AuthMode get mode => _mode;
  set mode(AuthMode value) {
    _mode = value;
    notifyListeners();
  }

  bool get isLogin => _mode == AuthMode.Login;
  bool get isSignup => _mode == AuthMode.Signup;
  bool isRecover = false;
  bool isAccountConfirmation = false;

  AuthMode opposite() {
    return _mode == AuthMode.Login ? AuthMode.Signup : AuthMode.Login;
  }

  AuthMode switchAuth() {
    if (mode == AuthMode.Login) {
      mode = AuthMode.Signup;
    } else if (mode == AuthMode.Signup) {
      mode = AuthMode.Login;
    }
    return mode;
  }

  String _email = '';
  get email => _email;
  set email(String email) {
    _email = email;
    notifyListeners();
  }

  String _password = '';
  get password => _password;
  set password(String password) {
    _password = password;
    notifyListeners();
  }

  String _confirmPassword = '';
  get confirmPassword => _confirmPassword;
  set confirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    notifyListeners();
  }

  String _confirmationCode = '';
  get confirmationCode => _confirmationCode;
  set confirmationCode(String confirmationCode) {
    _confirmationCode = confirmationCode;
    notifyListeners();
  }
}
