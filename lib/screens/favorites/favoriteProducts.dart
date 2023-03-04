import 'package:flutter/material.dart';
import 'package:products/utils/utils.dart';

class FavoriteProducts extends StatelessWidget{
  const FavoriteProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite products'),
      ),
      body: Container(
        color: getColor(),
      ),
    );
  }
}
