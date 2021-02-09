import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_demo/src/models/product_model.dart';

class CatalogBloc {
  final _repository = Repository();
  final _catalogFetcher = PublishSubject<CatalogModel>();

  Stream<CatalogModel> get catalog => _catalogFetcher.stream;

  fetchCatalog() async {
    CatalogModel cat = await _repository.fetchCatalog();
    _catalogFetcher.sink.add(cat);
  }

  dispose() {
    _catalogFetcher.close();
  }
}

final bloc = CatalogBloc();
