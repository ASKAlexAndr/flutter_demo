import 'dart:async';
import 'api/api_base.dart';
import 'package:meta/meta.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthRepository {
  final _controller = StreamController<AuthStatus>();
  final ApiBase _api = ApiBase();

  Stream<AuthStatus> get status async* {
    final Map<String, String> token = await _api.getToken();
    yield token.containsKey("Token")
        ? AuthStatus.authenticated
        : AuthStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<dynamic> getCode({@required String phone}) async {
    Map<String, dynamic> data = await _api.post("login/", {"phone": phone});
    return data;
  }

  Future<void> logIn({@required String phone, @required String code}) async {
    Map<String, dynamic> data =
        await _api.post("login/", {"phone": phone, "code": code});
    if (data["result"] == "success") {
      await _api.setToken(phone, data["hash"]);
      _controller.add(AuthStatus.authenticated);
    }
  }

  Future<void> logOut() async {
    await _api.clearToken();
    _controller.add(AuthStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
