import 'package:store_app/model/product_model.dart';

class CartDetailModel{
  int? id;
  ProductModel? product;
  String? color;
  int? quantity;
  String? type;

  CartDetailModel({
    this.id,
    this.product,
    this.color ,
    this.quantity,
    this.type
  });

  factory CartDetailModel.fromJson(Map<String,dynamic> obj){
    return CartDetailModel(
      id: obj["id"],
      product: ProductModel.fromJson(obj["product"]),
      color: obj["color"],
      quantity: obj["quantity"],
      type: obj["type"]
    );
  }
}