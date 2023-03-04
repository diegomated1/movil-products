import 'package:flutter/material.dart';
import 'package:products/services/userServices.dart';
import 'package:get/get.dart';

import '../../widgets/button.dart';
import '../../widgets/input.dart';

class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {

  late Map<String, String> userInfo = {
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
      var logged = await UserApi().login(userInfo: userInfo);
      if(logged['error']==0){
        Get.toNamed('/profile');
      }else{
        if(mounted){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(logged['message']),
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
                Input(labelText: 'Email', handler: change),
                Input(labelText: 'Password', handler: change, hidden: true,),
                Button(labelText: 'Login', handler: (){
                  submit(context);
                },),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
