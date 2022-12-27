import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:store_app/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  List<ProductModel> list = [];
  Future<int> getList(String data) async {
    String apiURL = "https://flutterserverdemo20221204094255.azurewebsites.net/api/Product/getproducts/" + data;
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(jsonString.body);
    var productListObject = jsonObject as List;
    list = productListObject.map((e) {
      return ProductModel.fromJson(e);
    }).toList();
    notifyListeners();
    return 1;
  }

  void getListBrand(String data, String searchKey) async {
    await getList(searchKey);
    if(data == "All"){
      return;
    }
    List<ProductModel> temp = [];
    for(var i in list){
      if(i.nameFactory == data){
        temp.add(i);
      }
    }
    list = temp;
  }

}