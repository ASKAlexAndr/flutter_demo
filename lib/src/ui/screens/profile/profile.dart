import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/src/blocs/auth/auth_bloc.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton(
          child: Text("LogOut"),
          onPressed: () => {context.read<AuthBloc>().add(AuthLogout())},
        ),
      ),
    );
  }
}
