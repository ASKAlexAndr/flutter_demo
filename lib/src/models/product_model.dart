class ProductModel {
  int _id;
  String _name;
  String _code;
  String _sostav;
  String _picture;
  String _detail_picture;
  List<dynamic> _skus;

  int get id => _id;
  String get name => _name;
  String get code => _code;
  String get sostav => _sostav;
  String get picture => _picture;
  String get detailPicture => _detail_picture;

  ProductModel(product) {
    _id = product['id'];
    _name = product['name'];
    _code = product['code'];
    _sostav = product['sostav'];
    _picture = product['picture'];
    _detail_picture = product['detail_picture'];
  }

  ProductModel.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _name = parsedJson['name'];
    _code = parsedJson['code'];
    _sostav = parsedJson['sostav'];
    _picture = parsedJson['picture'];
    _detail_picture = parsedJson['detail_picture'];
  }
}

class CatalogModel {
  List<ProductModel> _items;

  List<ProductModel> get items => _items;

  CatalogModel.fromJson(Map<String, dynamic> parsedJson) {
    List<ProductModel> temp = [];
    for (int i = 0; i < parsedJson["catalog"][0]["data"].length; i++) {
      ProductModel product = ProductModel(parsedJson["catalog"][0]["data"][i]);
      temp.add(product);
    }
    _items = temp;
  }
}
