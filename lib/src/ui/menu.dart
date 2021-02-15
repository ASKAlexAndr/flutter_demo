import 'package:flutter/material.dart';
import '../blocs/catalog_bloc.dart';
import '../models/product_model.dart';
import 'product_datail.dart';

class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuState();
  }
}

class _MenuState extends State<Menu> {
  @override
  void initState() {
    super.initState();
    bloc.fetchCatalog();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.catalog,
        builder: (context, AsyncSnapshot<CatalogModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<CatalogModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.items.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: Image.network(
                snapshot.data.items[index].picture,
                fit: BoxFit.cover,
              ),
              onTap: () => openProductDetail(snapshot.data.items[index], index),
            ),
          );
        });
  }

  openProductDetail(ProductModel data, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ProductDetail(product: data);
    }));
  }
}
