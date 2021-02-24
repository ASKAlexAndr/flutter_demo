import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/src/config/application.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../config/routes.dart';
import '../../repositories/auth_repository.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        switch (state.status) {
          case AuthStatus.authenticated:
            Application.router.navigateTo(context, Routes.catalog);
            break;
          case AuthStatus.unauthenticated:
            Application.router.navigateTo(context, Routes.auth);
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
