import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/product_model.dart';

class CatalogApiProvider {
  Client client = Client();
  final _uri = "https://xn--80apbiftl8ba8cm0b.xn--p1ai/api/public/catalog/";

  Future<CatalogModel> fetchCatalog() async {
    final response = await client.get(_uri);
    if (response.statusCode == 200) {
      return CatalogModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load catalog');
    }
  }
}
