import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

class LoginData {
  final String name;
  final String password;
  final String confirmationCode;

  LoginData({
    @required this.name,
    @required this.password,
    this.confirmationCode
  });

  @override
  String toString() {
    return '$runtimeType($name, $password, $confirmationCode)';
  }

  bool operator ==(Object other) {
    if (other is LoginData) {
      return name == other.name && password == other.password && confirmationCode == other.confirmationCode;
    }
    return false;
  }

  int get hashCode => hash3(name, password, confirmationCode);
}
