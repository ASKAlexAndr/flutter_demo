class Catalog {
  List<Section> _sections;

  List<Section> get sections => _sections;

  Catalog.fromJson(Map<String, dynamic> catalogJson) {
    List<Section> sections = [];
    for (var sectionData in catalogJson["catalog"]) {
      Section section = Section.fromJson(sectionData);
      sections.add(section);
    }
    _sections = sections;
  }
}

class Section {
  int _id;
  String _name;
  String _code;
  List<Product> _items;

  int get id => _id;
  String get name => _name;
  String get code => _code;
  List<dynamic> get items => _items;

  Section(int id, String name, String code, List<Product> items) {
    _id = id;
    _name = name;
    _code = code;
    _items = items;
  }

  Section.fromJson(Map<String, dynamic> sectionJson) {
    _id = sectionJson['id'];
    _name = sectionJson['name'];
    _code = sectionJson['code'];
    final products = <Product>[];
    for (var productData in sectionJson["data"]) {
      final product = Product.fromJson(productData);
      products.add(product);
    }
    _items = products;
  }
}

class Product {
  int _id;
  String _name;
  String _code;
  String _sostav;
  String _picture;
  String _detailPicture;
  List<dynamic> _skus;

  int get id => _id;
  String get name => _name;
  String get code => _code;
  String get sostav => _sostav;
  String get picture => _picture;
  String get detailPicture => _detailPicture;

  Product(product) {
    _id = product['id'];
    _name = product['name'];
    _code = product['code'];
    _sostav = product['sostav'];
    _picture = product['picture'];
    _detailPicture = product['detail_picture'];
  }

  Product.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _name = parsedJson['name'];
    _code = parsedJson['code'];
    _sostav = parsedJson['sostav'];
    _picture = parsedJson['picture'];
    _detailPicture = parsedJson['detail_picture'];
  }
}
