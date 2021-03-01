part of 'catalog_cubit.dart';

class CatalogState extends Equatable {
  const CatalogState(this.catalog) : super();

  final CatalogModel catalog;
  @override
  List<Object> get props => [catalog];

  CatalogState setCatalog(Map<String, dynamic> data) {
    return CatalogState(CatalogModel.fromJson(data));
  }
}

class CatalogInitial extends CatalogState {
  CatalogInitial() : super(CatalogModel());
}
