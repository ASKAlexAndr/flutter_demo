import 'package:flutter/material.dart';
import 'package:flutter_demo/src/repositories/auth_repository.dart';
import 'package:flutter_demo/src/repositories/user_repository.dart';
import 'src/app.dart';

void main() {
  runApp(
      App(authRepository: AuthRepository(), userRepository: UserRepository()));
}
