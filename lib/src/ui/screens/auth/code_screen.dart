import 'package:flutter/material.dart';
import 'package:flutter_demo/src/ui/auth/code_form.dart';

class CodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            body: Center(
                child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: CodeForm(),
    ))));
  }
}
