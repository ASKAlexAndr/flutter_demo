import '../models/user.dart';
import 'api/api_base.dart';

class UserRepository {
  User _user;
  final ApiBase _api = ApiBase();

  Future<User> getUser() async {
    if (_user != null) return _user;

    Map<String, dynamic> response = await _api.getWithToken("me/");
    print(response);
    if (response["result"] != "error") {
      _user = User(response["id"], response["name"]);
      return _user;
    } else {
      print(response["detail"]);
      return null;
    }
  }
}
