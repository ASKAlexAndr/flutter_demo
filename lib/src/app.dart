import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/src/config/routes.dart';
import 'blocs/auth/auth_bloc.dart';
import './config/application.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider(
      create: (context) =>
          AuthBloc(Application.authRepository, Application.userRepository),
      child: new MaterialApp(
        onGenerateRoute: Routes.generateRoutes,
        initialRoute: Routes.root,
      ),
    );
    return provider;
  }
}
