import 'package:fluro/fluro.dart';

import 'routes.dart';
import '../repositories/auth_repository.dart';
import '../repositories/user_repository.dart';

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
