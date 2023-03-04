import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  String url = 'http://192.168.0.11:3000';

  Future auth() async {
    
  }

  Future<Map<String, dynamic>> login({required Map<String, String> userInfo,}) async {
    try{
      var headers = {"Content-type": "application/json"};
      var body = json.encode(userInfo); 
      var response = await http.post(Uri.parse('$url/user/auth/login'), headers: headers, body: body);
      if(response.statusCode == 200){
        var body = json.decode(response.body);
        var token = body['userToken'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userToken', token);
        return body;
      } else {
        var body = json.decode(response.body);
        return body;
      }
    }catch(e){
      print(e.toString());
      return {
        "status": false,
        "message": "Internal error"
      };
    }
  }

  Future<Map<String, dynamic>> register({required Map<String, String> userInfo,}) async {
    try{
      var headers = {"Content-type": "application/json"};
      var body = json.encode(userInfo); 
      var response = await http.post(Uri.parse('$url/user/auth/register'), headers: headers, body: body);
      if(response.statusCode == 200){
        var body = json.decode(response.body);
        var token = body['userToken'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userToken', token);
        return body;
      } else {
        var body = json.decode(response.body);
        return body;
      }
    }catch(e){
      print(e.toString());
      return {
        "status": false,
        "message": "Internal error"
      };
    }
  }
}