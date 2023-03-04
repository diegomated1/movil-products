import 'package:flutter/material.dart';
import 'package:products/providers/userProvider.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:products/screens/login/login.dart';
import 'package:products/screens/register/register.dart';

import '../../widgets/button.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {

    var usr = context.watch<UserProvider>();

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
