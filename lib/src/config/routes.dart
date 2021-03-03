import 'package:flutter/material.dart';
import 'package:flutter_demo/src/blocs/auth/auth_bloc.dart';
import 'package:flutter_demo/src/repositories/auth_repository.dart';
import 'package:flutter_demo/src/ui/bottom_navigator.dart';
import 'package:flutter_demo/src/ui/screens/auth/auth_screen.dart';
import 'package:flutter_demo/src/ui/screens/auth/code_screen.dart';
import 'package:flutter_demo/src/ui/screens/menu/product_datail.dart';
import 'package:flutter_demo/src/ui/screens/splash_screen.dart';

class Routes {
  static const String root = "/";
  static const String app = "/app";
  static const String auth = "/auth";
  static const String code = "/auth/code";
  static const String product = "/app/product";

  static Route<dynamic> generateRoutes(RouteSettings settings,
      [AuthState state]) {
    switch (settings.name) {
      case Routes.root:
        return state != null && state.status == AuthStatus.authenticated
            ? MaterialPageRoute<dynamic>(builder: (_) => BottomNavigator())
            : MaterialPageRoute<dynamic>(builder: (_) => AuthScreen());
      case Routes.auth:
        return MaterialPageRoute<dynamic>(builder: (_) => AuthScreen());
      case Routes.code:
        return MaterialPageRoute<dynamic>(builder: (_) => CodeScreen());
      case Routes.app:
        return MaterialPageRoute<dynamic>(builder: (_) => BottomNavigator());
      case Routes.product:
        return MaterialPageRoute<dynamic>(
            builder: (_) => ProductDetail(settings.arguments));
      default:
        return MaterialPageRoute<dynamic>(builder: (_) => SplashScreen());
    }
  }
}
