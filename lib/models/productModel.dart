class ProductModel {
  ProductModel({
    required this.idProduct,
    required this.name,
    required this.description,
    required this.idSeller,
    required this.sellerName,
    required this.calification,
  });
  
  final String idProduct;
  final String name;
  final String description;
  final String idSeller;
  final String sellerName;
  final double calification;

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
      idProduct: json['id_product'],
      name: json['name'],
      description: json['description'],
      idSeller: json['id_seller'],
      sellerName: json['seller_name'],
      calification: json['calification'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_product': idProduct,
      'name': name,
      'description': description,
      'id_seller': idSeller,
      'seller_name': sellerName,
      'calification': calification,
    };
  }
}

class ProductsModel {
  ProductsModel({required this.products});

  final List<ProductModel> products;
  
  factory ProductsModel.fromJson(List<dynamic> json){
    List<ProductModel> lista = json.map((student) => ProductModel.fromJson(student)).toList();
    return ProductsModel(products: lista);
  }
}
