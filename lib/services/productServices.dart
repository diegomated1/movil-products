import 'dart:convert';
import 'package:products/models/favoritesModel.dart';
import 'package:products/models/productModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  String url = 'http://192.168.0.11:3000';

  Future<ProductsModel> getAll() async {
    try{
      final prefs = await SharedPreferences.getInstance();
      var userToken = prefs.getString('userToken');
      if(userToken==null){
        return ProductsModel.fromJson([]);
      }
      var headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer $userToken"
      };
      var response = await http.get(Uri.parse('$url/products'), headers: headers);
      if(response.statusCode == 200){
        var body = json.decode(response.body);
        return ProductsModel.fromJson(body['products']);
      } else {
        return ProductsModel.fromJson([]);
      }
    }catch(e){
      print(e.toString());
      return ProductsModel.fromJson([]);
    }
  }

  Future<FavoritesModel> getFavorites() async {
    try{
      final prefs = await SharedPreferences.getInstance();
      var userToken = prefs.getString('userToken');
      if(userToken==null){
        return FavoritesModel.fromJson([]);
      }
      var headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer $userToken"
      };
      var response = await http.get(Uri.parse('$url/products/favorite'), headers: headers);
      if(response.statusCode == 200){
        var body = json.decode(response.body);
        return FavoritesModel.fromJson(body['products']);
      } else {
        return FavoritesModel.fromJson([]);
      }
    }catch(e){
      print(e.toString());
        return FavoritesModel.fromJson([]);
    }
  }

  Future<bool> addFavorite({required String idProduct}) async {
    try{
      final prefs = await SharedPreferences.getInstance();
      var userToken = prefs.getString('userToken');
      if(userToken==null){
        return false;
      }
      var headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer $userToken"
      };
      var response = await http.post(Uri.parse('$url/products/favorite/$idProduct'), headers: headers);
      if(response.statusCode == 200){
        return true;
      } else {
        return false;
      }
    }catch(e){
      print(e.toString());
        return false;
    }
  }

  Future deleteFavorite({required String idProduct}) async {
    try{
      final prefs = await SharedPreferences.getInstance();
      var userToken = prefs.getString('userToken');
      if(userToken==null){
        return false;
      }
      var headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer $userToken"
      };
      var response = await http.delete(Uri.parse('$url/products/favorite/$idProduct'), headers: headers);
      if(response.statusCode == 200){
        return true;
      } else {
        return false;
      }
    }catch(e){
      print(e.toString());
        return false;
    }
  }

}