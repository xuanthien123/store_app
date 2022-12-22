import 'package:flutter/material.dart';
import 'package:akar_icons_flutter/akar_icons_flutter.dart';
import "package:iconforest_icon_park/icon_park.dart";
import 'package:store_app/HomePage.dart';

import 'my_favorite.dart';
class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({Key? key}) : super(key: key);

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  int index = 1;
  Widget data = const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data,
      bottomNavigationBar: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  index = 1;
                  data = const HomePage();
                });
              },
              child: Icon(
                AkarIcons.home,
                color: (index == 1?Colors.deepOrange:null),
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  index = 2;
                });
              },
              child: IconPark(
                IconPark.bill,height: 25,
                color: (index == 2?Colors.deepOrange:Theme.of(context).shadowColor),
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  index = 3;
                  data = const MyFavorite();
                });
              },
              child: Icon(
                AkarIcons.heart,
                color: (index == 3?Colors.deepOrange:null),
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  index = 4;
                });
              },
              child: Icon(
                AkarIcons.bell,
                color: (index == 4?Colors.deepOrange:null),
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  index = 5;
                });
              },
              child: Icon(
                AkarIcons.person,
                color: (index == 5?Colors.deepOrange:null),
              ),
            ),

          ],
        ),

      ),
    );
  }
}
