import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'app_exceptions.dart';

class ApiBase {
  final String _baseUrl = "https://xn--80apbiftl8ba8cm0b.xn--p1ai/api/public/";

  Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<dynamic> get(String url, [Map<String, String> params]) async {
    var responseJson;
    var uri = Uri.https(_baseUrl, url, params);
    try {
      final response = await http.get(uri, headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    print(responseJson);
    return responseJson;
  }

  Future<dynamic> post(String url, Map<String, String> params) async {
    var responseJson;
    var uri = Uri.https(_baseUrl, url);
    try {
      var uri = Uri.https(_baseUrl, url, params);
      final response =
          await http.post(uri, headers: headers, body: jsonEncode(params));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    print(responseJson);
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
