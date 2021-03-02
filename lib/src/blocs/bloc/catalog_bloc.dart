import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_demo/src/models/product_model.dart';
import 'package:flutter_demo/src/repositories/catalog_repository.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final CatalogRepository catalogRepository;
  CatalogBloc(this.catalogRepository) : super(CatalogInitial());

  @override
  Stream<CatalogState> mapEventToState(
    CatalogEvent event,
  ) async* {
    if (event is GetCatalog) {
      yield CatalogOnLoad();
      final Map<String, dynamic> data = await catalogRepository.getCatalog();
      yield CatalogIsLoaded(CatalogModel.fromJson(data));
    }
  }
}
