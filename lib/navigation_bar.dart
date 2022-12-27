import 'package:flutter/material.dart';
import 'package:akar_icons_flutter/akar_icons_flutter.dart';
import "package:iconforest_icon_park/icon_park.dart";
import 'package:store_app/HomePage.dart';
import 'package:store_app/my_orders.dart';
import 'package:store_app/user_screen.dart';

import 'my_favorite.dart';
import 'notifications.dart';
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
        color: Theme.of(context).scaffoldBackgroundColor,
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
              child: Container(
                padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10, top: 10),
                child: Icon(
                  AkarIcons.home,
                  color: (index == 1?Colors.deepOrange:null),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  index = 2;
                  data = const Order();
                });
              },
              child: Container(
                padding: const EdgeInsets.only(left: 10,right: 10,bottom: 7,top: 7),
                child: IconPark(
                  IconPark.bill,height: 24, width: 24, fit: BoxFit.cover,
                  color: (index == 2?Colors.deepOrange:Theme.of(context).shadowColor),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  index = 3;
                  data = const MyFavorite();
                });
              },
              child: Container(
                padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10, top: 10),
                child: Icon(
                  AkarIcons.heart,
                  color: (index == 3?Colors.deepOrange:null),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  index = 4;
                  data = const Notifications();
                });
              },
              child: Container(
                padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10, top: 10),
                child: Icon(
                  AkarIcons.bell,
                  color: (index == 4?Colors.deepOrange:null),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  index = 5;
                  data = const UserScreen();
                });
              },
              child: Container(
                padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10, top: 10),
                child: Icon(
                  AkarIcons.person,
                  color: (index == 5?Colors.deepOrange:null),
                ),
              ),
            ),

          ],
        ),

      ),
    );
  }
}
