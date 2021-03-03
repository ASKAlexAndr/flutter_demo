import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/src/blocs/login/login_cubit.dart';
import 'blocs/auth/auth_bloc.dart';
import './config/application.dart';
import 'config/routes.dart';
import 'repositories/auth_repository.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AuthBloc>(
        create: (context) =>
            AuthBloc(Application.authRepository, Application.userRepository),
      ),
      BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(
          Application.authRepository,
        ),
      )
    ], child: AppView());
  }
}

class AppView extends StatelessWidget {
  AppView({Key key}) : super(key: key);

  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is AuthState) {
        switch (state.status) {
          case AuthStatus.authenticated:
            _navigator.pushNamedAndRemoveUntil<void>(
              Routes.app,
              (route) => false,
            );
            break;
          case AuthStatus.unauthenticated:
            _navigator.pushNamedAndRemoveUntil<void>(
              Routes.auth,
              (route) => false,
            );
            break;
          default:
            break;
        }
      }
    }, builder: (context, state) {
      return MaterialApp(
        navigatorKey: _navigatorKey,
        onGenerateRoute: (settings) => Routes.generateRoutes(settings, state),
        initialRoute: Routes.root,
      );
    });
  }
}
