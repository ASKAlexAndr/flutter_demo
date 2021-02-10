import 'package:flutter_demo/src/models/user.dart';
import 'package:flutter_demo/src/repositories/api/api_base.dart';

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
