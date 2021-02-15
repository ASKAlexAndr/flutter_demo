import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/auth/auth_bloc.dart';
import './config/app_provider.dart';
import './config/application.dart';

class App extends StatelessWidget {
  const App({Key key, this.application}) : super(key: key);

  final Application application;

  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider(
      create: (context) => AuthBloc(application),
      child: new MaterialApp(
        onGenerateRoute: application.router.generator,
      ),
    );
    final appProvider = AppProvider(child: provider, application: application);
    return appProvider;
  }
}
