import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/src/blocs/catalog_bloc.dart';
import 'package:flutter_demo/src/blocs/login/login_cubit.dart';
import 'package:flutter_demo/src/config/routes.dart';
import 'package:flutter_demo/src/ui/auth/code_page.dart';
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
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (prev, cur) => prev.status != cur.status,
      listener: (context, state) {
        if (state.status == LoginStatus.code)
          Navigator.of(context).push(new MaterialPageRoute<dynamic>(
              builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<LoginCubit>(context),
                    child: CodePage(),
                  )));
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              key: const Key("phoneForm"),
              inputFormatters: [formatter],
              decoration: InputDecoration(
                labelText: "Телефон",
              ),
              onChanged: (phone) =>
                  context.read<LoginCubit>().phoneChanged(phone),
              onSubmitted: (phone) =>
                  context.read<LoginCubit>().phoneSubmit(phone),
            ),
            if (state.status == LoginStatus.loading) CircularProgressIndicator()
          ],
        );
      },
    );
  }
}
