import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../screen/spash/constants.dart';

import '../spash/size_config.dart';
import '../../model/detailProduct_Model.dart';
class CustomAppBar extends StatelessWidget {
  CustomAppBar({Key? key, required this.data1}) :super(key: key);
  final List<CommentRate> data1;

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  primary: kPrimaryColor,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () => Navigator.pop(context),
                child:const Icon(Icons.arrow_back_outlined),
              ),
            ),
            Spacer(),
         /*   Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Text(
                    "",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  *//*const SizedBox(width: 5),
                  SvgPicture.asset("assets/icons/Star Icon.svg"),*//*
                ],
              ),
            )*/
          ],
        ),
      ),
    );
  }
}