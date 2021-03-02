import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth/auth_bloc.dart';
import '../repositories/auth_repository.dart';
import 'auth.dart';
import 'bottom_navigator.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (prev, cur) => prev?.status != cur?.status,
      builder: (context, state) {
        if (state is AuthState) {
          switch (state.status) {
            case AuthStatus.authenticated:
              return BottomNavigator();
            case AuthStatus.unauthenticated:
              return Auth();
            default:
              return Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
          }
        } else
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
      },
    );
  }
}
