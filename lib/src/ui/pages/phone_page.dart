import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/src/blocs/login/login_cubit.dart';
import 'package:flutter_demo/src/config/application.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../repositories/user_repository.dart';
import '../auth/phone_form.dart';

class PhonePage extends StatefulWidget {
  final UserRepository userRepository;
  PhonePage({Key key, this.userRepository}) : super(key: key);

  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
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
          ))),
    );
  }
}
