part of 'catalog_bloc.dart';

abstract class CatalogState extends Equatable {
  const CatalogState();

  @override
  List<Object> get props => [];
}

class CatalogInitial extends CatalogState {}

class CatalogOnLoad extends CatalogState {}

class CatalogIsLoaded extends CatalogState {
  final Catalog catalog;

  CatalogIsLoaded(this.catalog);

  @override
  List<Object> get props => [catalog];
}
