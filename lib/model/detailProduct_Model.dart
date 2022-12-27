
const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
// ending for our demo product

class Product{
  final int idProduct;
  final String description;
  final String nameCategory;
  final String nameProduct;
  final String nameFactory;

  Product(
      { required this.description,required this.nameCategory,required this.nameProduct,required this.nameFactory, required this.idProduct
      });
  factory Product.fromJson(Map<String,dynamic> obj){

    return Product(
        idProduct: obj['idProduct'],
        description: obj['description'],
        nameProduct: obj['nameProduct'],
        nameFactory: obj['nameFactory'],
        nameCategory: obj['nameCategory']


    );
  }}
class Images{
  late int? IDDetailImage;
  late int? IDProduct;
  late  String? URlImage;
  Images({this.IDDetailImage,this.IDProduct,this.URlImage});
  factory Images.fromJson(Map<String,dynamic> obj){
    return Images(
      IDDetailImage: obj['idDetailImage'],
      IDProduct: obj['idProduct'],
      URlImage: obj['urlImage'],


    );
  }
}
class ForModel{

  static List<DetailProduct> changeTolistDetailProducts(List<dynamic> obj)
  {
    List<DetailProduct> lst=[];
    var listObject = obj as List;
    lst = listObject.map((e){
      return DetailProduct.fromJson(e);
    }).toList();
    return lst;
  }
  static List<Images> changeTolistImages(List<dynamic> obj)
  {
    List<Images> lst=[];
    var listObject = obj as List;
    lst = listObject.map((e){
      return Images.fromJson(e);
    }).toList();
    return lst;
  }
  static List<CommentRate> changeTolistCommentRate(List<dynamic> obj)
  {
    List<CommentRate> lst=[];
    var listObject = obj as List;
    lst = listObject.map((e){
      return CommentRate.fromJson(e);
    }).toList();
    return lst;
  }
}
class DetailProduct{
  late int? IDDetailproduct;
  late int? IDProduct;
  late String? SpecificationProduct;
  late double? Price;
  late String? ColorName;
  late String? ColorCode;
  late int? Stock;
  DetailProduct({this.IDDetailproduct,this.IDProduct,this.SpecificationProduct,this.Price,this.ColorName,this.ColorCode,this.Stock});
  factory DetailProduct.fromJson(Map<String,dynamic> obj){
    return DetailProduct(
      IDDetailproduct: obj['idDetailproduct'],
      IDProduct: obj['idProduct'],
      SpecificationProduct: obj['specificationProduct'],
      Price: obj['price'],
      ColorName: obj['colorName'],
      ColorCode: obj['colorCode'],
      Stock: obj['stock'],
    );
  }
}
class CommentRate{
  late int? IDComment;
  late int? IDProduct;
  late String? Content;
  late DateTime? CommentDate;
  late double? Rate;
  late int? IDUser;
  CommentRate({this.IDComment,this.IDProduct,this.Content,this.CommentDate,this.Rate,this.IDUser});
  factory CommentRate.fromJson(Map<String,dynamic> obj){
    return CommentRate(
      IDComment: obj['idComment'],
      IDProduct: obj['idProduct'],
      Content: obj['content'],
      CommentDate: DateTime.parse(obj['commentDate']),
      Rate: obj['rate'],
      IDUser: obj['idUser'],

    );

  }
}