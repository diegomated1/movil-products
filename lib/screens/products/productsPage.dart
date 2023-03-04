import 'package:flutter/material.dart';
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
  late Future<ProductsModel?> products;

  @override
  void initState() {
    super.initState();
    setState(() {
      products = ProductApi().getAll();
    });
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: products,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ProductListExtended(products: snapshot.data!.products);
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
    );
  }

}
