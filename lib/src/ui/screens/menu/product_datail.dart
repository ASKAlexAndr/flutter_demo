import 'package:flutter/material.dart';
import '../../../models/product_model.dart';

class ProductDetail extends StatefulWidget {
  final ProductModel product;

  ProductDetail(
    this.product,
  );

  @override
  State<StatefulWidget> createState() {
    return _ProductDetailState(
      product,
    );
  }
}

class _ProductDetailState extends State<ProductDetail> {
  final ProductModel product;

  _ProductDetailState(
    this.product,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                elevation: 0.0,
                brightness: Brightness.light,
                flexibleSpace: FlexibleSpaceBar(
                    background: Hero(
                        tag: product.picture,
                        child: Image.network(
                          product.detailPicture,
                          fit: BoxFit.cover,
                        ))),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(margin: EdgeInsets.only(top: 5.0)),
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                Text(product.sostav),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
