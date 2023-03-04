import 'package:flutter/material.dart';
import 'package:products/models/productModel.dart';
import 'package:products/screens/products/productExtended.dart';
import 'package:products/screens/products/productSimple.dart';
import 'package:products/utils/utils.dart';

import '../../services/productServices.dart';

class ProductListExtended extends StatelessWidget{
  const ProductListExtended({
    super.key,
    required this.products,
    required this.favorites,
    required this.refresh
  });

  final List<ProductModel> products;
  final Map<String, bool> favorites;
  final Function() refresh;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            ProductExtended(product: products[index]),
            Positioned(
              right: 5,
              top: 5,
              child: SizedBox(
                width: 40,
                height: 40,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: ()async{
                    bool response;
                    if(favorites[products[index].idProduct]==true){
                      response = await ProductApi().deleteFavorite(idProduct: products[index].idProduct);
                    }else{
                      response = await ProductApi().addFavorite(idProduct: products[index].idProduct);
                    }
                    if(response){
                      refresh();
                    }
                  },
                  icon: Icon(
                    Icons.star,
                    size: 40,
                    color: (favorites[products[index].idProduct]==true) ? Colors.yellow : Colors.black,
                  ),
                ),
              )
            )
          ]
        );
      },
    );
  }
}




