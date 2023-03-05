import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:products/screens/login/login.dart';
import 'package:products/screens/register/register.dart';

import '../../services/favoriteServices.dart';
import '../../services/userServices.dart';
import '../../widgets/button.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<StatefulWidget> createState() => _Auth();
}

class _Auth extends State<Auth> {

  getUser()async{
    var data = await UserApi().auth();
    if(data!=null){
      await FavoriteProductsDB.instance.sync();
      Get.toNamed('/profile');
    }
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth'),
      ),
      body: Center(
        child: FittedBox(
          child: Column(
            children: [
              Button(
                labelText: 'Login', 
                handler: (){
                  Get.to(()=>const Login());
                }
              ),
              Button(
                labelText: 'Register', 
                handler: (){
                  Get.to(()=>const Register());
                }
              ),
            ],
          ),
        )
      ),
    );
  }

}
