import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final _storage = FlutterSecureStorage();

  Future saveToken(String user, String token) async {
    await _storage.write(key: "User", value: user);
    await _storage.write(key: "Token", value: token);
  }

  Future getToken() async {
    Map<String, String> tokenData = await _storage.readAll();
    return tokenData;
  }

  Future clearToken() async {
    await _storage.deleteAll();
  }
}
