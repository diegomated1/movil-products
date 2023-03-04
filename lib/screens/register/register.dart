import 'package:flutter/material.dart';

import '../../services/userServices.dart';
import '../../widgets/button.dart';
import '../../widgets/input.dart';
import '../products/productsPage.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget{
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {

  late Map<String, String> userInfo = {
    "username": '',
    "email": '',
    "password": '',
  };

  change(String label, String newValue){
    userInfo[label.split(' ').join('_').toLowerCase()] = newValue;
  }

  var loginForm = GlobalKey<FormState>();

  submit(BuildContext context)async{
    if(loginForm.currentState!.validate()){
      loginForm.currentState!.save();
      var registered = await UserApi().register(userInfo: userInfo);
      if(registered['error']==0){
        Get.to(()=>const ProductsPage());
      }else{
        if(mounted){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(registered['message']),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: FittedBox(
          child: Form(
            key: loginForm,
            child: Column(
              children: [
                Input(labelText: 'Username', handler: change),
                Input(labelText: 'Email', handler: change),
                Input(labelText: 'Password', handler: change, hidden: true,),
                Button(labelText: 'Register', handler: (){
                  submit(context);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
