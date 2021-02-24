import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/src/blocs/login/login_cubit.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../blocs/auth/auth_bloc.dart';

class PhoneForm extends StatefulWidget {
  AuthBloc authBloc;

  PhoneForm({Key key, this.authBloc}) : super(key: key);

  @override
  _PhoneFormState createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  final MaskTextInputFormatter formatter =
      MaskTextInputFormatter(mask: "+# ### ### ##-##", initialText: "7");

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextField(
          key: const Key("phoneForm"),
          inputFormatters: [formatter],
          decoration: InputDecoration(
            labelText: "Телефон",
          ),
          onChanged: (phone) => context
              .read<LoginCubit>()
              .phoneChanged(formatter.getUnmaskedText()),
          onSubmitted: (phone) => context.read<LoginCubit>().phoneSubmit(phone),
        );
      },
    );
  }
}
