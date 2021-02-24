import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/src/blocs/login/login_cubit.dart';
import 'package:flutter_demo/src/config/application.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../repositories/user_repository.dart';
import '../auth/code_form.dart';

class CodePage extends StatefulWidget {
  final UserRepository userRepository;
  CodePage({Key key, this.userRepository}) : super(key: key);

  @override
  _CodePageState createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
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
            child: CodeForm(),
          ))),
    );
  }
}
