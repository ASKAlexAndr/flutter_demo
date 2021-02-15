import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/login/login_bloc.dart';

class PhoneForm extends StatefulWidget {
  AuthBloc authBloc;
  PhoneForm({Key key, this.authBloc}) : super(key: key);

  @override
  _PhoneFormState createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextField(
          key: const Key("phoneForm"),
          controller: _phoneController,
        );
      },
    );
  }

  _onSubmit() {}
}
