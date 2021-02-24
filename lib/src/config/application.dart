import 'package:fluro/fluro.dart';

import 'routes.dart';
import '../repositories/auth_repository.dart';
import '../repositories/user_repository.dart';

class Application {
  static FluroRouter router;
  static AuthRepository authRepository;
  static UserRepository userRepository;

  static void init() {
    _initRouter();
    authRepository = new AuthRepository();
    userRepository = new UserRepository();
  }

  static void _initRouter() {
    router = new FluroRouter();
    Routes.configureRoutes(router);
  }
}
