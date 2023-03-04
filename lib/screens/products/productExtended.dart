
import 'package:flutter/material.dart';
import 'package:products/models/productModel.dart';
import 'package:products/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:products/widgets/button.dart';

import '../../widgets/photo.dart';

class ProductExtended extends StatefulWidget{
  const ProductExtended({
    super.key,
    required this.product
  });
  
  final ProductModel product;

  @override
  State<StatefulWidget> createState() => _ProductExtended();
}

class _ProductExtended extends State<ProductExtended>{

  @override
  Widget build(BuildContext context) {

    //final width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(5.0),
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
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Photo(id: widget.product.idProduct,)
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Info(title: 'Name', child: Text(widget.product.name)),
                Info(title: 'Seller', child: Text(widget.product.sellerName)),
                Info(title: 'Calification', child: Text(widget.product.calification.toString())),
              ],
            )
          )
        ],
      )
    );
  }
}

class Info extends StatelessWidget {
  const Info({
    super.key,
    required this.title,
    required this.child
  });

  final String title;
  final Widget child;
  
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold
              ),
            )
          ),
          Expanded(
            child: child,
          )
        ],
      ),
    ); 
  }
}