class ProductModel{
  int? idProduct;
  String? description;
  String? nameCategory;
  String? nameProduct;
  String? nameFactory;
  int? idDetailImage;
  String? urlImage;
  int? price;
  double? rate;

  ProductModel({this.idProduct,this.description,this.nameCategory,this.nameProduct,this.nameFactory,this.idDetailImage,this.urlImage,this.price,this.rate});

  factory ProductModel.fromJson(Map<String,dynamic> obj){
    return ProductModel(
        idProduct: obj["idProduct"],
        description: obj["description"],
        nameCategory:obj["nameCategory"],
        nameProduct: obj["nameProduct"],
        nameFactory: obj["nameFactory"],
        idDetailImage: obj["idDetailImage"],
        urlImage: obj["urlImage"],
        price: obj["price"],
        rate: double.parse(obj["rate"].toString())
    );
  }
}