import 'package:flutter/material.dart';
import 'package:flutter_demo/src/config/routes.dart';
import 'package:flutter_demo/src/models/catalog_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key key, this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        child: InkResponse(
            enableFeedback: true,
            child: Row(
              children: [
                Flexible(
                    child: Hero(
                        tag: product.picture,
                        child: Image.network(
                          product.picture,
                          fit: BoxFit.cover,
                        ))),
                Flexible(
                  child: Text(product.name),
                )
              ],
            ),
            onTap: () => Navigator.of(context)
                .pushNamed(Routes.product, arguments: product)));
  }
}
