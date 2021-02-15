import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/app_provider.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/login/login_bloc.dart';
import '../../repositories/user_repository.dart';
import '../auth/phone_form.dart';

class PhonePage extends StatefulWidget {
  final UserRepository userRepository;
  PhonePage({Key key, this.userRepository}) : super(key: key);

  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  AuthBloc authBloc;
  LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    _init(context);
    return Container(
      child: PhoneForm(authBloc: authBloc),
    );
  }

  void _init(BuildContext context) {
    if (null == loginBloc) {
      final app = AppProvider.getApplication(context);
      authBloc = AuthBloc(app);
      loginBloc =
          LoginBloc(authRepository: app.authRepository, authBloc: authBloc);
    }
  }
}
