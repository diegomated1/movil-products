
import 'package:flutter/material.dart';
import 'package:products/models/productModel.dart';
import 'package:products/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:products/widgets/button.dart';

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

class Photo extends StatelessWidget {
  const Photo({
    super.key,
    required this.id
  });

  final String id;

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    String url = 'http://192.168.0.11:3000/images/products';

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 4.0,
                offset: Offset(0.0, 0.75)
              )
            ],
            color: Color.fromARGB(255, 234, 234, 234),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: 
            CachedNetworkImage(
              imageUrl: '$url/$id',
              fit: BoxFit.fill,
              errorWidget: ((context, url, error) {
                return Container(
                  color: getColor(),
                  child: Icon(
                    Icons.person,
                    size: (width >= 380) ? 90 : (width*90)/380,
                  ),
                );
              }),
            )
          )
        ),
        Positioned(
          right: 0,
          child: SizedBox(
            width: 40,
            height: 40,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: (){},
              icon: const Icon(
                Icons.star,
                size: 40,
                color: Colors.yellow,
              ),
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
    required this.child
  });

  final String title;
  final Widget child;
  
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Row(
        children: [
          FittedBox(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold
              ),
            )
          ),
          Expanded(
            child: Center(
              child: child,
            )
          )
        ],
      ),
    ); 
  }

}