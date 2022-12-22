import '../model/cart_detail_model.dart';

class ForModel{
  static List<CartDetailModel> changeToList(Map<String,dynamic> obj){
    List<CartDetailModel> lst = [];
    var cartListObject = obj as List;
    lst = cartListObject.map((e) {
      return CartDetailModel.fromJson(e);
    }).toList();
    return lst;
  }
}