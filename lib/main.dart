import 'package:flutter/material.dart';
import 'src/config/application.dart';
import 'src/app.dart';

void main() {
  var application = Application();
  application.init();
  runApp(App(application: application));
}
