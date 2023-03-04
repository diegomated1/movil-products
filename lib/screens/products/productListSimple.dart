import 'package:flutter/material.dart';
import 'package:products/models/productModel.dart';
import 'package:products/screens/products/productSimple.dart';
import 'package:products/services/productServices.dart';
import 'package:products/utils/utils.dart';

class ProductListSimple extends StatelessWidget{
  const ProductListSimple({
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
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            ProductSimple(product: products[index],),
            Positioned(
              right: 0,
              top: 15,
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




