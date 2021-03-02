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
    return GridView.builder(
        itemCount: catalog.items.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: SizedBox(
                  child: Hero(
                      tag: catalog.items[index].picture,
                      child: Image.network(
                        catalog.items[index].picture,
                        fit: BoxFit.cover,
                      ))),
              // onTap: () => openProductDetail(catalog.items[index], index),
              onTap: () => Navigator.of(context)
                  .pushNamed(Routes.product, arguments: catalog.items[index]),
            ),
          );
        });
  }
}
