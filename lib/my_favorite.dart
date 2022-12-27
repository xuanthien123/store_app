import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/login_screen.dart';
import 'package:store_app/processd_checkout.dart';
import 'package:store_app/provider/search_product_provider.dart';

import 'detail_order.dart';
import 'function/get_grid_view_product.dart';
class MyFavorite extends StatefulWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  State<MyFavorite> createState() => _MyFavoriteState();
}

class _MyFavoriteState extends State<MyFavorite> {
  bool isStart = true;
  @override
  Widget build(BuildContext context) {
  var productProvider = Provider.of<SearchProductProvider>(context);
  if(isStart){
    productProvider.getListBrand("Apple","","Newest");
    isStart = false;
  }
  var list1 = productProvider.list;
  List<Container> listSearchProduct = GetGridViewProduct.getGrid(context, list1);
    return SafeArea(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text(
                  "My Favorite",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 25
                  ),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 310,
                    height: 40,
                    padding: EdgeInsets.only(left: 10),

                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search favorite...",
                          icon: Image.asset("assets/images/search_icon.png")
                      ),
                      autofocus: false,

                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen())
                        );
                      },
                      child: Icon(
                        Icons.shopping_bag_outlined,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...listSearchProduct
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
