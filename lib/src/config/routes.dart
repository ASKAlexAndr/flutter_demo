import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/src/ui/auth.dart';
import 'package:flutter_demo/src/ui/pages/code_page.dart';
import '../ui/pages/home_page.dart';
import '../ui/pages/phone_page.dart';
import '../ui/pages/root_page.dart';

// var phoneHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return RootPage();
// });

// var codeHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return RootPage();
// });

class Routes {
  static String root = "/";
  static String auth = "/auth";
  static String authPhone = "/auth/phone";
  static String authCode = "/auth/code";
  static String app = "/app";
  static String catalog = "/app/catalog";
  static String product = "/app/catalog/product";
  static String cart = "/app/cart";
  static String profile = "/app/profile";

  static Handler rootHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return RootPage();
  });
  static Handler homeHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return HomePage();
  });
  static Handler authHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Auth();
  });
  static Handler phoneHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return PhonePage();
  });
  static Handler codeHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return CodePage();
  });
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE NOT FOUND !!!");
      return;
    });
    router.define(root, handler: rootHandler);
    router.define(auth, handler: authHandler);
    router.define(authPhone, handler: phoneHandler);
    router.define(authCode, handler: codeHandler);
    router.define(app, handler: homeHandler);
  }
}
