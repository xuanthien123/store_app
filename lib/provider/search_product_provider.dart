import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:store_app/model/product_model.dart';
import 'package:http/http.dart' as http;

class SearchProductProvider extends ChangeNotifier {
  List<ProductModel> list = [];
  void getList(String data,String sort) async {
    String apiURL = "https://flutterserverdemo20221204094255.azurewebsites.net/api/Product/getproducts/" + data;
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(jsonString.body);
    var productListObject = jsonObject as List;
    list = productListObject.map((e) {
      return ProductModel.fromJson(e);
    }).toList();
    if(sort == "A-Z"){
      sortProductFromAToZ();
    }
    else if(sort == "Low to high"){
      sortProductFromLowToHigh();
    }
    else if(sort == "High to low"){
      sortProductFromHighToLow();
    }
    notifyListeners();
  }

  void getListBrand(String data, String searchKey, String sort) async {
    getList(searchKey, sort);
    List<ProductModel> temp = [];
    for(var i in list){
      if(i.nameFactory == data){
        temp.add(i);
      }
    }
    list = temp;
  }

  int mySortComparisonAToZ(ProductModel a, ProductModel b) {
    final propertyA = a.nameProduct??"";
    final propertyB = b.nameProduct??"";
    return propertyA.compareTo(propertyB);
  }

  int mySortComparisonHighToLow(ProductModel a, ProductModel b) {
    final propertyA = a.price??0;
    final propertyB = b.price??0;
    return propertyB.compareTo(propertyA);
  }
  int mySortComparisonLowToHigh(ProductModel a, ProductModel b) {
    final propertyA = a.price??0;
    final propertyB = b.price??0;
    return propertyA.compareTo(propertyB);
  }

  void sortProductFromAToZ() async {
    // getListBrand(data,searchKey);
    List<ProductModel> temp = list;
    temp.sort(mySortComparisonAToZ);
    list = temp;
    notifyListeners();
  }
  void sortProductFromHighToLow() async {
    // getListBrand(data,searchKey);
    List<ProductModel> temp = list;
    temp.sort(mySortComparisonHighToLow);
    list = temp;
    notifyListeners();
  }
  void sortProductFromLowToHigh() async {
    // getListBrand(data,searchKey);
    List<ProductModel> temp = list;
    temp.sort(mySortComparisonLowToHigh);
    list = temp;
    notifyListeners();
  }

}