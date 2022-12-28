import '../function/for_model.dart';
import 'cart_detail_model.dart';

class CartModel{
  int? id;
  List<CartDetailModel>? list;

  CartModel({this.id,this.list});


  factory CartModel.fromJson(Map<String,dynamic> obj){
    return CartModel(
        id: obj["id"],
        list: ForModel.changeToList(obj["list"])
    );
  }
}
