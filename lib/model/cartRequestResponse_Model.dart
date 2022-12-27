
import 'package:flutter/widgets.dart';

import 'detailProduct_Model.dart';

class addcartrequest{
  late int IdDetailProduct;
  late int Quantity;
  late int IdUser;
  addcartrequest(this.IdDetailProduct,this.Quantity,this.IdUser);
}

class detailproductresponse {
  late Product product=Product(description: "",idProduct: 0,nameCategory: "",nameFactory: "",nameProduct: "");
  List<Images> imageList=[];

  late List<DetailProduct> detailProductList=[DetailProduct(IDProduct: 0,ColorCode: "",ColorName: "",IDDetailproduct: 0,Price: 0,SpecificationProduct: "",Stock: 0)];
  late List<CommentRate> listCommentRate=[CommentRate(IDProduct: 0,CommentDate: DateTime.now(),Content: "",IDComment: 0,IDUser: 0,Rate: 0)];
  detailproductresponse({required this.product,required this.imageList,required this.detailProductList,required this.listCommentRate});

  factory detailproductresponse.fromJson(Map<String,dynamic> obj){

    return (detailproductresponse(
      product:Product.fromJson(obj['product']),
      imageList:ForModel.changeTolistImages(obj["imageList"]),
      detailProductList:ForModel.changeTolistDetailProducts(obj["detailProductList"]),
      listCommentRate: ForModel.changeTolistCommentRate(obj['listCommentRate']) ,
    )

    );
  }
}
