/*
import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:untitled3/models/cartRequestResponse.dart';
import 'package:untitled3/productdetail.dart';


class DetailProductProvider {


  Future<detailproductresponse> getData(int params,BuildContext context)  async {
  try{
    String apiURL="https://flutterserverdemo20221204094255.azurewebsites.net/api/Product/getdetailproducts/"+params.toString();
   // var client=http.Client();
    detailproductresponse result;
    Response response = await get(
        Uri.parse(apiURL)
    );
    if(response.statusCode == 200){
      print("aloalo1");
      var jsonObject =jsonDecode(response.body);
      var newObject= jsonObject as detailproductresponse;
      print("aloalo2");
      Map<String, dynamic> map = {
        'product': newObject.product,
        'imagelist': newObject.imageList,
        'listCommentRate': newObject.listCommentRate,
        'detailProductList':newObject.detailProductList
      };
      print("aloalo3");
      result= detailproductresponse.fromJson(map);
      return result;
    }
  }
  catch(e)
   {
     print(e.toString());
   }
   return;

  }

}*/
