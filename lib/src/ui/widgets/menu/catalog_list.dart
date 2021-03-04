import 'package:flutter/material.dart';
import 'package:flutter_demo/src/config/routes.dart';
import 'package:flutter_demo/src/models/catalog_model.dart';
import 'package:flutter_demo/src/ui/widgets/menu/product_card.dart';

class CatalogList extends StatefulWidget {
  CatalogList({Key key, this.catalog}) : super(key: key);
  final Catalog catalog;

  @override
  _CatalogListState createState() => _CatalogListState();
}

class _CatalogListState extends State<CatalogList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Column(
        children: [
          Expanded(flex: 1, child: buildListHeader),
          Expanded(flex: 9, child: buildCatalogList),
        ],
      )),
    );
  }

  Widget get buildListHeader {
    return ListView.builder(
      itemCount: widget.catalog.sections.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => buildSectionTab(index),
    );
  }

  Widget buildSectionTab(int index) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            widget.catalog.sections[index].name,
            style: TextStyle(fontSize: 14),
          ),
        ));
  }

  Widget get buildCatalogList {
    return ListView.builder(
        itemCount: widget.catalog.sections.length,
        itemBuilder: (context, index) =>
            buildSection(widget.catalog.sections[index]));
  }

  Widget buildSection(Section section) {
    return Column(
      children: [
        Divider(),
        Text(section.name),
        Card(
          child: buildProductsList(section.items),
        )
      ],
    );
  }
}

Widget buildProductsList(List<Product> products) {
  return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => ProductCard(product: products[index]),
      shrinkWrap: true,
      physics: ScrollPhysics());
}
