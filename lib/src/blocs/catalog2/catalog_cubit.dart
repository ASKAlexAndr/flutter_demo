import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_demo/src/models/product_model.dart';
import 'package:flutter_demo/src/repositories/catalog_repository.dart';

part 'catalog_state.dart';

class CatalogCubit extends Cubit<CatalogState> {
  final CatalogRepository catalogRepository;
  CatalogCubit(this.catalogRepository) : super(CatalogInitial());

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error);
    super.onError(error, stackTrace);
  }

  @override
  void onChange(Change<CatalogState> change) {
    print(change);
    super.onChange(change);
  }

  Future<void> loadCatalog() async {
    final Map<String, dynamic> data = await catalogRepository.getCatalog();
    emit(state.setCatalog(data));
  }
}
