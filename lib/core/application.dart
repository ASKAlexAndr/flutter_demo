import 'package:fluro/fluro.dart';
import 'package:flutter_demo/core/routes.dart';
import 'package:flutter_demo/src/repositories/auth_repository.dart';
import 'package:flutter_demo/src/repositories/user_repository.dart';

class Application {
  FluroRouter router;
  AuthRepository authRepository;
  UserRepository userRepository;

  void init() {
    _initRouter();
    authRepository = AuthRepository();
    userRepository = UserRepository();
  }

  void _initRouter() {
    router = new FluroRouter();
    Routes.configureRoutes(router);
  }
}
