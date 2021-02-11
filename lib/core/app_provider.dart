import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/core/application.dart';

class AppProvider extends InheritedWidget {
  final Application application;

  AppProvider({Key key, Widget child, this.application})
      : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static AppProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppProvider>();
  }

  static FluroRouter getRouter(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AppProvider>()
        .application
        .router;
  }

  static Application getApplication(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AppProvider>()
        .application;
  }
}
