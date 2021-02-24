import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/src/blocs/auth/auth_bloc.dart';
import 'package:flutter_demo/src/blocs/login/login_cubit.dart';
import 'package:flutter_demo/src/config/application.dart';
import 'package:flutter_demo/src/config/routes.dart';
import 'package:flutter_demo/src/repositories/user_repository.dart';

class Auth extends StatelessWidget {
  const Auth({Key key, this.userRepository}) : super(key: key);
  final UserRepository userRepository;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider(
          create: (context) => LoginCubit(
                Application.authRepository,
                BlocProvider.of<AuthBloc>(context),
              ),
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              print(state.page);
              switch (state.page) {
                case LoginPage.phone:
                  Application.router.navigateTo(context, Routes.authPhone);
                  break;
                case LoginPage.code:
                  Application.router.navigateTo(context, Routes.authCode);
                  break;
                default:
                  break;
              }
            },
            child: Center(child: CircularProgressIndicator()),
          )),
    );
  }
}
