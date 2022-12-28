import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import '../../components/default_button.dart';
import '../../components/rounded_icon_btn.dart';
import '../../model/detailProduct_Model.dart';
import '../../provider/user_provider.dart';
import '../../screen/components/top_rounded_container.dart';
import '../spash/constants.dart';
import '../spash/size_config.dart';

class productspecification extends StatefulWidget {
  const productspecification({Key? key,required this.deitailProductForSpecification, required this.listdetail, required this.IDUser}) : super(key: key);
final List<DetailProduct> deitailProductForSpecification;
final int IDUser;
final List<DetailProduct> listdetail;
  @override
  State<productspecification> createState() => _productspecificationState();
}
int selectedColor = 0;
int number=1;
int isSelected = 0;
bool isSelectedForColor=true;
List<DetailProduct> detailvar=[];
int selectedProduct=0;
class _productspecificationState extends State<productspecification> {

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    // Now this is fixed and only for demo
    return
      Padding(padding:
      EdgeInsets.only(left: 15),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                EdgeInsets.all(5),
                child: Text(
                  "Specifications:",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline6,
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    widget.deitailProductForSpecification.length,
                        (index) =>
                        buildContainerspecification(
                            index
                        ),
                  ),
                ],
              ),
              buildColorList(context,getListDetailForIndex(isSelected)),
              TopRoundedContainer(
                color: hexToColor("#F3F3F3"),
                child: Padding(
                  padding: EdgeInsets.only(

                    bottom: getProportionateScreenWidth(0),
                    top: getProportionateScreenWidth(0),
                  ),
                  child: DefaultButton(
                    text:    widget.deitailProductForSpecification[0].Price,
                    press: () {
                      AddToCart(context,userProvider.user.idUser!);
                    },
                  ),

                ),
              ),
            ],
          )
      );
  }
  Future<void> AddToCart (BuildContext context,int id)  async {
    try{
      print(id);
      print(selectedProduct);
      print(number);
      if(selectedProduct==0){
        selectedProduct=widget.deitailProductForSpecification[0].IDDetailproduct!;
      }
      Response response = await post(
          Uri.parse('https://flutterserverdemo20221204094255.azurewebsites.net/api/Cart/createcart'),
          headers:{'Content-Type': 'application/json'},
          body:jsonEncode({
            "idDetailProduct":selectedProduct,
            "quantity": number,
            "idUser":  id,
          },)
      );
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print(data.toString()+"alo alo");

      }else {

      }
    }catch(e){

    }
  }
  GestureDetector buildContainerspecification(index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(5),
        height: getProportionateScreenWidth(30),
        width: getProportionateScreenWidth(60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              color: kPrimaryColor.withOpacity(isSelected == index ? 1 : 0)),
        ),
        child: Text(widget.deitailProductForSpecification[index].SpecificationProduct.toString(),
          textAlign: TextAlign.center,),
      ),
    );
  }
List<DetailProduct> getListDetailForIndex(int id){
    List<DetailProduct>check=[];
    for(int i=0;i<widget.listdetail.length;i++){
      if(widget.deitailProductForSpecification[id].SpecificationProduct==widget.listdetail[i].SpecificationProduct){
        check.add(widget.listdetail[i]);
      }
    }
    setState(() {
      detailvar=check;
    });
    return check;
}
  Widget buildColorList(BuildContext context,List<DetailProduct> listdetailcheck) {
    return Padding(
        padding:
        EdgeInsets.only(left: 0),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
              EdgeInsets.only(left: 5, top: 5, right: 0, bottom: 5),
              child: Text(
                "Colors:",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6,
              ),
            ),
            Row(
              children: [
                ...List.generate(

                listdetailcheck.length,
                      (index) =>
                      buildSelectedColor(
                          index,listdetailcheck
                      ),
                ),
                SizedBox.fromSize(size: Size(
                    0 * double.parse(   listdetailcheck.length.toString()), 2)),
                RoundedIconBtn(
                  icon: Icons.remove,
                  press: () {
                    if (number > 1) {
                      setState(() {
                        number = number - 1;
                      });
                    }
                  },
                ),
                Container(

                  width: getProportionateScreenWidth(30),
                  child: (Text(number.toString(), textAlign: TextAlign.center)),
                ),
                // SizedBox(width: getProportionateScreenWidth(20)),
                RoundedIconBtn(
                  icon: Icons.add,
                  showShadow: true,
                  press: () {
                    setState(() {
                      number = number + 1;
                    });
                  },
                ),
              ],
            ),
          ],
        )
    );
  }

  GestureDetector buildSelectedColor(int index,List<DetailProduct> checklist) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = index;
          selectedProduct=checklist[index].IDDetailproduct!;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedColor == index ? 1 : 0)),
        ),
        child:
        DecoratedBox(
          decoration: BoxDecoration(
              color: hexToColor(checklist[index].ColorCode.toString()),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }


  Widget ColorDotForColor() {
    return
      Container(
        margin: EdgeInsets.only(right: 2),
        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
        height: getProportionateScreenWidth(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border:
          Border.all(
              color: isSelectedForColor ? kPrimaryColor : Colors.transparent),
          shape: BoxShape.circle,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
      );
  }
}




/*
class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
   // required this.color,
    this.isSelected = false,
  }) : super(key: key);

 // final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
        Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        child: Text("240gb"),
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}*/
