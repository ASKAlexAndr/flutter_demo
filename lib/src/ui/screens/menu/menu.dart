import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/src/blocs/bloc/catalog_bloc.dart';
import 'package:flutter_demo/src/config/application.dart';
import 'package:flutter_demo/src/config/routes.dart';
import '../../../models/product_model.dart';

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
            return buildList(state.catalog);
          }
          return null;
        }),
      ),
    );
  }

  Widget buildList(CatalogModel catalog) {
    return ListView.builder(
        itemCount: catalog.items.length,
        itemBuilder: (BuildContext context, int index) {
          return InkResponse(
              enableFeedback: true,
              child: Row(
                children: [
                  Flexible(
                      child: Hero(
                          tag: catalog.items[index].picture,
                          child: Image.network(
                            catalog.items[index].picture,
                            fit: BoxFit.cover,
                          ))),
                  Flexible(
                    child: Text(catalog.items[index].name),
                  )
                ],
              ),
              onTap: () => Navigator.of(context)
                  .pushNamed(Routes.product, arguments: catalog.items[index]));
        });
  }
}
