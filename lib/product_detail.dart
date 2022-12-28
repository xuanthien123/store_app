import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:store_app/provider/user_provider.dart';
import '../screen/components/body.dart';
import '../screen/components/custom_app_bar.dart';
import 'model/cartRequestResponse_Model.dart';
import 'model/detailProduct_Model.dart';
bool isLoading = true;
detailproductresponse? tam1;
//=detailproductresponse(product:checktam.productcheck , imageList: checktam.imagecheck, detailProductList: checktam.detailproductcheck, listCommentRate: checktam.commentratecheck);
class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}
class _DetailScreenState extends State<DetailScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      asyncMethod(context);
    });
    // TODO: implement initState
    super.initState(
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(data1 : tam1!.listCommentRate,),
      ),
      body: Body(data : tam1! ),
    );
  }
  void asyncMethod(BuildContext context,) async {

    var check=await checktam.fetchData(widget.id, context);
    setState(() {
      tam1=check;
    });
  }
}
class checktam{
  static List<Images> imagecheck=[Images(IDDetailImage: 0,IDProduct: 0,URlImage: ""),];
  static Product productcheck=Product(description: "",idProduct: 0,nameCategory: "",nameFactory: "",nameProduct: "");
  static List<DetailProduct> detailproductcheck=[DetailProduct(IDProduct: 0,ColorCode: "",ColorName: "",IDDetailproduct: 0,Price: 0,SpecificationProduct: "",Stock: 0)];
  static List<CommentRate> commentratecheck=[CommentRate(IDProduct: 0,CommentDate: DateTime.now(),Content: "",IDComment: 0,IDUser: 0,Rate: 0)];
  static detailproductresponse tam=detailproductresponse(product: productcheck, imageList:imagecheck , detailProductList: detailproductcheck, listCommentRate: commentratecheck);
  static detailproductresponse globalvar=tam;
  static Future<detailproductresponse> fetchData (int id,BuildContext context)  async {
    globalvar=tam;
    try{
      //print('$acc,$pass');
      String apiURL="https://flutterserverdemo20221204094255.azurewebsites.net/api/Product/getdetailproducts/"+id.toString();
      Response response = await get(
        Uri.parse(apiURL),
      );
      List<detailproductresponse> list=[];
      if(response.statusCode == 200){
        Map<String, dynamic> map = json.decode(response.body);


        // dynamic data = map['product'];
        // print(map);
        //print(data);
        var value=  detailproductresponse.fromJson(map);
        print("success");
        //var globalvar=value;
        globalvar=value;

/*      var newListObject= jsonObject as List;
      List<dynamic> data = jsonObject[0];*/

        // detailproductresponse.fromJson(data[0]);
/*      list =newListObject.map((e){
        return detailproductresponse.fromJson(e);
      }).toList();*/
        /*  Map<String, dynamic> map = {
        'product': newObject.product,
        'imagelist': newObject.imageList,
        'listCommentRate': newObject.listCommentRate,
        'detailProductList':newObject.detailProductList
      };
*/
        //var result= detailproductresponse.fromJson(newObject);
        return value;
      }else {
        return  tam;
      }
    }catch(e){

    }
    return tam;
  }
}