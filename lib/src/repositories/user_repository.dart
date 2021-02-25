import '../models/user.dart';
import 'api/api_base.dart';

class UserRepository {
  User _user;
  final ApiBase _api = new ApiBase();

  Future<User> getUser() async {
    if (_user != null) return _user;

    Map<String, dynamic> resp = await _api.get("me/");
    print(resp);

    // return User();
  }
}
