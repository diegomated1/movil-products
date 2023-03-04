import 'package:flutter/material.dart';
import 'package:products/models/favoritesModel.dart';
import 'package:products/models/productModel.dart';
import 'package:products/screens/products/productListExtended.dart';
import 'package:products/screens/products/productListSimple.dart';
import 'package:products/services/productServices.dart';
import 'package:products/utils/utils.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget{
  const ProductsPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProductsPage();
}

class _ProductsPage extends State<ProductsPage> {
  late Future<ProductsModel> products;
  late Future<FavoritesModel> favorites;  
  int displayType = 0;

  changeDisplayType(){
    setState(() {
      if(displayType==1){
        displayType = 0;
      }else{
        displayType = 1;
      }
    });
  }

  hangleGetProducts(){
    print("aaaaa");
    setState(() {
      products = ProductApi().getAll();
      favorites = ProductApi().getFavorites();
    });
  }

  @override
  void initState() {
    super.initState();
    hangleGetProducts();
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 60,
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: changeDisplayType,
                  icon: const Icon(
                    Icons.swap_horiz_outlined,
                    size: 60,
                    color: Colors.black,
                  ),
                ),
              )
            ),
            Expanded(
              child: FutureBuilder(
                future: Future.wait([products, favorites]),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    if(displayType==0){
                      return ProductListSimple(
                        products: (snapshot.data![0] as ProductsModel).products,
                        favorites: (snapshot.data![1] as FavoritesModel).favorites,
                        refresh: hangleGetProducts,
                      );
                    }else{
                      return ProductListExtended(
                        products: (snapshot.data![0] as ProductsModel).products,
                        favorites: (snapshot.data![1] as FavoritesModel).favorites,
                        refresh: hangleGetProducts,
                      );
                    }
                  }else{
                    return const Center(
                      child: FittedBox(
                        child: Text('No data'),
                      ),
                    );
                  }
                },
              ),
            ),
          ]
        ),
      ),
    );
  }

}
