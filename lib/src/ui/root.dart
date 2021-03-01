import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth/auth_bloc.dart';
import '../config/routes.dart';
import '../repositories/auth_repository.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        switch (state.status) {
          case AuthStatus.authenticated:
            Navigator.of(context)
                .pushNamedAndRemoveUntil(Routes.app, (route) => false);
            break;
          case AuthStatus.unauthenticated:
            Navigator.of(context)
                .pushNamedAndRemoveUntil(Routes.auth, (route) => false);
            break;
          default:
            break;
        }
      },
      child: Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
