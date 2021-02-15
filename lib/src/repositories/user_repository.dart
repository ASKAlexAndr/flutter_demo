import '../models/user.dart';
import 'api/api_base.dart';

class UserRepository {
  User _user;
  ApiBase _apiBase;

  Future<User> getUser() async {
    if (_user != null) return _user;

    final resp = _apiBase.get("/me");
    print(resp);

    // return User();
  }
}
