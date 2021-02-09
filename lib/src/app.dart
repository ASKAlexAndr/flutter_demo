import 'package:flutter/material.dart';
import 'ui/bottom_navigator.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
      home: Scaffold(
        body: BottomNavigator(),
      ),
    );
  }
}
