import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/core/application.dart';
import 'package:flutter_demo/src/repositories/auth_repository.dart';
import 'package:flutter_demo/src/repositories/user_repository.dart';
import 'src/app.dart';

void main() {
  var application = Application();
  application.init();
  runApp(App(application));
}
