import 'package:flutter/material.dart';

import '../../widgets/button.dart';
import '../../widgets/input.dart';

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

  submit()async{
    if(loginForm.currentState!.validate()){
      loginForm.currentState!.save();
      print(userInfo.toString());
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
                Button(labelText: 'Register', handler: submit,),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
