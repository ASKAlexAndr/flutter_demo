import 'dart:async';
import 'package:flutter_demo/src/repositories/api/api_base.dart';
import 'package:flutter_demo/src/repositories/api/token_storage.dart';
import 'package:meta/meta.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthRepository {
  final _controller = StreamController<AuthStatus>();
  final ApiBase _api = ApiBase();
  final TokenStorage _tokenStorage = TokenStorage();

  Stream<AuthStatus> get status async* {
    final Map<String, String> token = await _tokenStorage.getToken();
    yield token.containsKey("Token")
        ? AuthStatus.authenticated
        : AuthStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({@required String phone, String code}) async {
    Map<String, String> data =
        await _api.post("login/", {phone: phone, code: "1111"});
    print(data);
    _controller.add(AuthStatus.authenticated);
  }

  Future<void> logOut() async {
    await _tokenStorage.clearToken();
    _controller.add(AuthStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
