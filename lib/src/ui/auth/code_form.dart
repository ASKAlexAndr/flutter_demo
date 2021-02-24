import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/src/blocs/login/login_cubit.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../blocs/auth/auth_bloc.dart';

class CodeForm extends StatefulWidget {
  AuthBloc authBloc;

  CodeForm({Key key, this.authBloc}) : super(key: key);

  @override
  _CodeFormState createState() => _CodeFormState();
}

class _CodeFormState extends State<CodeForm> {
  final MaskTextInputFormatter formatter =
      MaskTextInputFormatter(mask: "####", initialText: "");

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextField(
          key: const Key("codeForm"),
          inputFormatters: [formatter],
          decoration: InputDecoration(
            labelText: "Код",
          ),
          onChanged: (code) => context.read<LoginCubit>().codeChanged(code),
          onSubmitted: (code) => context.read<LoginCubit>().codeSubmit(code),
        );
      },
    );
  }
}
