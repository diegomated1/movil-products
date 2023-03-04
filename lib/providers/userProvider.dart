import 'package:products/models/userModel.dart';
import 'package:products/screens/products/productsPage.dart';
import 'package:products/services/userServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserProvider extends ChangeNotifier {

  late Future<UserModel> user;

  getUser()async{
    var data = await UserApi().auth();
    if(data!=null){
      Get.toNamed('/profile');
    }
  }

  UserProvider(){
    getUser();
  }
}