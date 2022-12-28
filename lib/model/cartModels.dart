import 'dart:core';

class Cart{
  String nameProduct;
  int idDetailProduct;
  int idCart;
  int idProduct;
  String specificationProduct;
  double price;
  String colorName;
  String colorCode;
  String urlImage;
  int stock;
  int quantity;
  Cart({
    required this.idDetailProduct,
    required this.idCart,
    required this.idProduct,
    required this.specificationProduct,
    required this.price,
    required this.colorName,
    required this.colorCode,
    required this.stock,
    required this.nameProduct,
    required this.urlImage,
    required this.quantity
  });

  factory Cart.fromJson(Map<String,dynamic> obj){
    return Cart(
        quantity: obj['quantity'],
        nameProduct:obj['nameProduct'],
        idDetailProduct: obj['idDetailProduct'],
        idCart: obj['idCart'],
        idProduct: obj['idProduct'],
        specificationProduct: obj['specificationProduct'],
        price: obj['price'],
        colorName: obj['colorName'],
        colorCode: obj['colorCode'],
        stock: obj['stock'],
        urlImage: obj['urlImage']
    );


  }
/*  static List<Cart> changeTolistCart(Map<String,dynamic> obj)
  {
    List<Cart> lst=[];
    var listObject = obj as List;
    lst = listObject.map((e){
      return Cart.fromJson(e);
    }).toList();
    return lst;
  }*/
}
/*
void add(Product pro,int sl){
  CartModel cart = new CartModel(model: pro,quantity: sl);
  for(int i = 0;i < list.length;i++){
    if(pro.id == list[i].model.id){
      list[i].quantity+=sl;
      return;
    }
  }
  list.add(cart);
}
void addQuatity(Product product){
  for(int i = 0;i<list.length;i++){
    if(product.id == list[i].model.id){list[i].quantity++;return;}

  }
}
void removeQuatity(Product product){
  for(int i = 0;i<list.length;i++){
    if(product.id == list[i].model.id){list[i].quantity--;return;}

  }
}

double total(){
  double totall=0;
  for(int i=0;i<list.length;i++){
    totall+=(list[i].quantity*list[i].model.price!);
  }
  return totall;
}
void removeProduct(int id){
  for(int i = 0;i<list.length;i++){
    if(id == list[i].model.id)
    {list.removeAt(i);}

  }*/
