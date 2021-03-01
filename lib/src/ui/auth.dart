import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/src/blocs/auth/auth_bloc.dart';
import 'package:flutter_demo/src/blocs/login/login_cubit.dart';
import 'package:flutter_demo/src/config/application.dart';
import 'auth/phone_form.dart';

class Auth extends StatelessWidget {
  const Auth({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: BlocProvider(
      create: (context) => LoginCubit(
        Application.authRepository,
        BlocProvider.of<AuthBloc>(context),
      ),
      child: Scaffold(
          body: Center(
        child: PhoneForm(),
      )),
    ));
  }
}
