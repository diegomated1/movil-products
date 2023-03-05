import 'package:flutter/material.dart';
import 'package:products/models/productModel.dart';
import 'package:products/screens/products/productSimple.dart';
class ProductListSimple extends StatelessWidget{
  const ProductListSimple({
    super.key,
    required this.products
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductSimple(product: products[index]);
      },
    );
  }
}




