import 'api/api_base.dart';

class CatalogRepository {
  final ApiBase _api = ApiBase();

  Future<dynamic> getCatalog() async {
    Map<String, dynamic> data = await _api.get(
      "catalog/",
    );
    return data;
  }
}
