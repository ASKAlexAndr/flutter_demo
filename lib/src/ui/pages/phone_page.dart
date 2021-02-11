import 'package:flutter/material.dart';

class PhonePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => PhonePage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
