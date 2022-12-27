import 'package:flutter/material.dart';
import '../../components/rounded_icon_btn.dart';
import '../../screen/components/product_specification.dart';

import '../spash/constants.dart';
import '../spash/size_config.dart';
class   _ColorDotsState extends State<productspecification> {
  int selectedColor = 0;
  int number=1;

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo


    return Padding(
        padding:
        EdgeInsets.only(left:15),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
              EdgeInsets.only(left:5,top:5,right:0,bottom: 5),
              child: Text(
                "Colors:",
                style: Theme.of(context).textTheme.headline6,

              ),
            ),
            Row(
              children: [
                ...List.generate(

                      widget.deitailProductForSpecification.length,
                      (index) =>buildSelectedColor(
                  index
                  ),
                ),



                SizedBox.fromSize( size: Size(48 * double.parse(widget.deitailProductForSpecification.length.toString()), 2)),
                RoundedIconBtn(
                  icon: Icons.remove,
                  press: () {
                    if(number>1){
                      setState(() {
                        number=number-1;
                      });
                    }

                  },
                ),
                Container(


                  width: getProportionateScreenWidth(30),
                  child: (Text(number.toString(),textAlign:TextAlign.center)),
                ),
                // SizedBox(width: getProportionateScreenWidth(20)),
                RoundedIconBtn(
                  icon: Icons.add,
                  showShadow: true,
                  press: () {
                      setState(() {
                        number=number+1;
                      });

                  },
                ),
              ],
            ), ],
        )

    );
  }
  GestureDetector buildSelectedColor(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = index;
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
            color:hexToColor(widget.deitailProductForSpecification[index].ColorCode.toString()),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

}


class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return
      Container(
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
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}