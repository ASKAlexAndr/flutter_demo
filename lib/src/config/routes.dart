import 'package:flutter/material.dart';
import 'package:flutter_demo/src/ui/auth.dart';
import 'package:flutter_demo/src/ui/bottom_navigator.dart';
import 'package:flutter_demo/src/ui/screens/menu/product_datail.dart';
import 'package:flutter_demo/src/ui/screens/splash_screen.dart';
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
