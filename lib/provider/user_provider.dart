import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:store_app/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  UserModel user = UserModel();
  Future<int> loginUser(String email, String password) async{
    final queryParameters = {
      'email': email,
      'password': password
    };
    String apiURL = "https://flutterserverdemo20221204094255.azurewebsites.net/api/User/loginuser";
    var client = http.Client();
    var response = await client.post(Uri.parse(apiURL),headers: {
      'Content-Type': 'application/json',
    }, body: jsonEncode(queryParameters));

    if(response.statusCode == 200){

      var jsonObject = jsonDecode(response.body);
      user = UserModel.fromJson(jsonObject);
    }
    else{
      return 0;
    }
    notifyListeners();
    return 1;
  }

  void logoutUser(){
    user = UserModel();
    notifyListeners();
  }
}