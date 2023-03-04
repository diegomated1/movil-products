import 'package:flutter/material.dart';
import 'package:products/utils/utils.dart';
import 'package:products/widgets/button.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget{
  const Profile({super.key});

  logout()async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userToken');
    Get.toNamed('/auth');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Container(
        color: getColor(),
        child: Center(
          child: FittedBox(
            child: Column(
              children: [
                Button(labelText: 'Products List', handler: (){
                  Get.toNamed('/products');
                }),
                Button(labelText: 'Favorite Products List', handler: (){
                  Get.toNamed('/favorites');
                }),
                Button(labelText: 'Logout', handler: logout),
              ],
            ),
          )
        ),
      )
    );
  }
}


