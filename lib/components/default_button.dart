import 'package:flutter/material.dart';
import '../components/gradient_text.dart';

import '../screen/spash/constants.dart';
import '../screen/spash/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    this.press,
  }) : super(key: key);
  final double? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {

    return
      Padding(
        padding: EdgeInsets.only(left: 0,right: 15,bottom: 10,top:0),
      child: Row(

        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [


              Padding(
                padding:
                EdgeInsets.only(left:0,right: 80),
                child: Text(
                  "Price:",
                  style:TextStyle(color: Color.fromRGBO(0, 0, 0, 0.25),fontSize: 15,fontWeight: FontWeight.bold,),textAlign: TextAlign.left,
                ),

              ),     Padding(
                padding:
                EdgeInsets.only(left:0,right: 0),
                child:
                Container(
                  width:120,
                  child:
                  GradientText(
                    text.toString(),
                    style: Theme.of(context).textTheme.headline6,
                    gradient: LinearGradient(colors: [
                      Colors.deepOrange.shade500,
                      Colors.yellow.shade500,
                    ]),
                  ),
                ),
              ),

            ],
          ),
        SizedBox(
          width: 208,
          height: 49,
          child: TextButton(

            style: TextButton.styleFrom(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              primary: Colors.white,
              backgroundColor: hexToColor("#F44C0F"),
            ),
            onPressed: press as void Function()?,
            child: Text(
              "Add to cart",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: Colors.white,
              ),
            ),
          ),
        ),
        ],
      ),);

  }

}
