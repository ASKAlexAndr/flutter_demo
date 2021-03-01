import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
    // TODO: implement mapEventToState
  }

  Future<void> loadCatalog() async {
    final Map<String, dynamic> data = await catalogRepository.getCatalog();
    // emit(state.setCatalog(data));
  }
}
