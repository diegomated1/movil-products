
import 'package:flutter/material.dart';
import 'package:products/models/productModel.dart';
import 'package:products/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../services/favoriteServices.dart';
import '../../widgets/photo.dart';

class ProductSimple extends StatefulWidget{
  const ProductSimple({
    super.key,
    required this.product
  });
  
  final ProductModel product;

  @override
  State<StatefulWidget> createState() => _ProductSimple();
}

class _ProductSimple extends State<ProductSimple>{

  bool isFavorite = false;

  Future favorite()async{
    var result = await FavoriteProductsDB.instance.getById(widget.product.idProduct);
    setState(() {
      isFavorite = (result.products.isEmpty) ? false : true;
    });
  }

  setFavorite()async{
    if(isFavorite){
      await FavoriteProductsDB.instance.delete(widget.product.idProduct);
    }else{
      await FavoriteProductsDB.instance.insert(widget.product);
    }
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  void initState() {
    super.initState();
    favorite();
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        SizedBox(
          height: (width >= 380) ? 150 : (width*150)/380,
          child: Center(
            child: 
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: Colors.grey,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 10.0,
                  )
                ]
              ),
              width: 360,
              height: (width >= 380) ? 120 : (width*120)/380,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Photo(id: widget.product.idProduct,),
                    )
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Column(
                        children: [
                          Info(title: 'Name', text: widget.product.name),
                          Info(title: 'Seller', text: widget.product.sellerName),
                          Info(title: 'Calification', text: widget.product.calification.toString()),
                        ],
                      ),
                    )
                  )
                ],
              ),
            ),
          )
        ),
        Positioned(
          right: 0,
          top: 15,
          child: SizedBox(
            width: 40,
            height: 40,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: setFavorite,
              icon: Icon(
                Icons.star,
                size: 40,
                color: (isFavorite) ? Colors.yellow : Colors.black,
              )
            ),
          )
        )
      ]
    );
  }
}


class Info extends StatelessWidget {
  const Info({
    super.key,
    required this.title,
    required this.text
  });

  final String title;
  final String text;
  
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            )
          ),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 17))
          )
        ],
      ),
    ); 
  }
}




