import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/src/blocs/login/login_cubit.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CodeForm extends StatefulWidget {
  CodeForm({Key key}) : super(key: key);

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
          autofocus: true,
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
