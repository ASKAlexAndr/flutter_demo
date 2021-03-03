import 'package:flutter/material.dart';
import 'package:flutter_demo/src/ui/auth/phone_form.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: Center(
        child: PhoneForm(),
      )),
    );
  }
}
