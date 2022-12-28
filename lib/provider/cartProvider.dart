
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/model/cartModels.dart';

import '../model/Cart_Model.dart';





class checkData {
  static Future<List<Cart>> fetchData(int id) async {
    List<Cart> list = [
      Cart(quantity: 0,
          nameProduct: "",
          urlImage: "",
          idDetailProduct: 0,
          idCart: 0,
          idProduct: 0,
          specificationProduct: "",
          price: 0,
          colorName: "",
          colorCode: "",
          stock: 0)
    ];
    try {
//print('$acc,$pass');
      String apiURL = "https://flutterserverdemo20221204094255.azurewebsites.net/api/Cart/getcart/" + id.toString();
      var client=http.Client();
      var jsonString= await client.get(Uri.parse(apiURL));
      var jsonObject =jsonDecode(jsonString.body);
      var newListObject= jsonObject as List;
      list =newListObject.map((e){
        return Cart.fromJson(e);
      }).toList();
      print("aloalo");
      }
     catch (e) {
      print(e.toString());
    }
    return list;
  }
}