import 'package:flutter/material.dart';
import '../auth/code_form.dart';

class CodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            body: Center(
      child: CodeForm(),
    )));
  }
}
