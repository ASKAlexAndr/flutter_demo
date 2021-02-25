import 'package:flutter/material.dart';
import 'package:flutter_demo/src/ui/auth.dart';
import 'package:flutter_demo/src/ui/auth/code_page.dart';
import 'package:flutter_demo/src/ui/menu.dart';
import 'package:flutter_demo/src/ui/pages/splash_page.dart';
import 'package:flutter_demo/src/ui/root.dart';

class Routes {
  static const String root = "/";
  static const String auth = "/auth";
  static const String app = "/app";
  static const String catalog = "/app/catalog";
  static const String product = "/app/catalog/product";
  static const String cart = "/app/cart";
  static const String profile = "/app/profile";

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute<dynamic>(builder: (_) => RootPage());
      case Routes.auth:
        return MaterialPageRoute<dynamic>(builder: (_) => Auth());
      case Routes.catalog:
        return MaterialPageRoute<dynamic>(builder: (_) => Menu());
      default:
        return MaterialPageRoute<dynamic>(builder: (_) => SplashPage());
    }
  }
}
