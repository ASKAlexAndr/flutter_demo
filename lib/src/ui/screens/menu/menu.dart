import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/src/blocs/bloc/catalog_bloc.dart';
import 'package:flutter_demo/src/config/application.dart';
import 'package:flutter_demo/src/ui/widgets/menu/catalog_list.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final CatalogBloc _catalogBloc = CatalogBloc(Application.catalogRepository);
  @override
  void initState() {
    _catalogBloc.add(GetCatalog());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider(
        create: (context) => _catalogBloc,
        child:
            BlocBuilder<CatalogBloc, CatalogState>(builder: (context, state) {
          if (state is CatalogInitial) {
            return Center(child: Text('Please Wait'));
          }
          if (state is CatalogOnLoad) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is CatalogIsLoaded) {
            return CatalogList(catalog: state.catalog);
          }
          return null;
        }),
      ),
    );
  }
}
