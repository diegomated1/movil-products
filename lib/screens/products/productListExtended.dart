import 'package:flutter/material.dart';
import 'package:products/models/productModel.dart';
import 'package:products/screens/products/productExtended.dart';
import 'package:products/screens/products/productSimple.dart';
import 'package:products/utils/utils.dart';

class ProductListExtended extends StatelessWidget{
  const ProductListExtended({
    super.key,
    required this.products
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: getColor(),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return ProductExtended(product: products[index]);
        },
      ),
    );
  }
}




