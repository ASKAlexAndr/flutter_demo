import '../repositories/catalog_repository.dart';
import '../repositories/auth_repository.dart';
import '../repositories/user_repository.dart';

class Application {
  static AuthRepository authRepository;
  static UserRepository userRepository;
  static CatalogRepository catalogRepository;

  static void init() {
    authRepository = new AuthRepository();
    userRepository = new UserRepository();
  }
}
