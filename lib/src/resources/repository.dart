import 'dart:async';
import 'catalog_api_provider.dart';
import '../models/product_model.dart';

class Repository {
  final moviesApiProvider = CatalogApiProvider();

  Future<CatalogModel> fetchCatalog() => moviesApiProvider.fetchCatalog();
}
