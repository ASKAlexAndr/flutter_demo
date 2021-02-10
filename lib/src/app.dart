import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/src/blocs/auth/auth_bloc.dart';
import 'package:flutter_demo/src/repositories/auth_repository.dart';
import 'package:flutter_demo/src/repositories/user_repository.dart';
import 'ui/bottom_navigator.dart';

class App extends StatelessWidget {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  const App({Key key, this.authRepository, this.userRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
        value: authRepository,
        child: BlocProvider(
            create: (_) => AuthBloc(
                authRepository: authRepository, userRepository: userRepository),
            child: MaterialApp(
              // theme: ThemeData.dark(),
              home: Scaffold(
                body: BottomNavigator(),
              ),
            )));
  }
}
