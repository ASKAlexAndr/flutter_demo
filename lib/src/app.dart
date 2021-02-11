import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/core/app_provider.dart';
import 'package:flutter_demo/core/application.dart';
import 'package:flutter_demo/src/blocs/auth/auth_bloc.dart';
import 'package:flutter_demo/src/repositories/auth_repository.dart';
import 'package:flutter_demo/src/repositories/user_repository.dart';
import 'package:flutter_demo/src/ui/pages/root_page.dart';
import 'ui/bottom_navigator.dart';

class App extends StatefulWidget {
  final Application _application;

  const App(this._application);

  @override
  _AppState createState() => _AppState(_application);
}

class _AppState extends State<App> {
  final Application _application;

  _AppState(this._application);

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
        initialRoute: "/", onGenerateRoute: _application.router.generator);
    print('initial core.route = ${app.initialRoute}');
    final appProvider = AppProvider(child: app, application: _application);
    return appProvider;
  }
}
