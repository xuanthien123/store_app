import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:store_app/function/get_grid_view_product.dart';
import 'package:store_app/provider/product_provider.dart';
import 'package:store_app/provider/theme_provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import "package:intl/intl.dart";
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDarkMode = false;
  var _tabIconIndexSelected = 0;
  var _listEmpty = ["", ""];
  var _listIconTabToggle = [
    Icons.light_mode_outlined,
    Icons.dark_mode_outlined,
  ];
  var formatter = NumberFormat('#,###');
  List<Widget> _listBanner = [];
  List<String> _brand = ["All", "Apple", "Samsung", "Xiaomi","Oppo", "Vivo", "Sony","Lenovo"];
  String genreSelected = 'All';

  @override
  Widget build(BuildContext context) {
    final themeProvider =
    Provider.of<ThemeProvider>(context, listen: false); // get the provider, listen false is necessary cause is in a function
    _tabIconIndexSelected = themeProvider.idTheme;
    var productProvider = Provider.of<ProductProvider>(context);
    if(genreSelected == "All"){
      productProvider.getList();
    }
    else{
      productProvider.getListBrand(genreSelected);
    }

      _listBanner.add(
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
              onTap: (){},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: AssetImage("assets/images/banner_1.png"),
                  fit: BoxFit.fill,
                ),
              ),

            ),
          ));
    _listBanner.add(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: InkWell(
            onTap: (){},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: AssetImage("assets/images/banner_2.png"),
                fit: BoxFit.fill,
              ),
            ),

          ),
        ));
    _listBanner.add(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: InkWell(
            onTap: (){},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: AssetImage("assets/images/banner_3.png"),
                fit: BoxFit.fill,
              ),
            ),

          ),
        ));

    List<Container> listProduct = GetGridViewProduct().getGrid(context, productProvider.list);

    return SafeArea(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15,top: 15,right: 15,bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Image(
                          image: AssetImage("assets/images/logo_2.png"),
                          height: 30,
                        ),
                      ),
                      FlutterToggleTab(
                        height: 32,
                        width: 30,
                        borderRadius: 15,
                        selectedIndex: _tabIconIndexSelected,
                        selectedTextStyle: TextStyle(
                            color: Theme.of(context).shadowColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        ),
                        unSelectedTextStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        ),
                        labels: _listEmpty,
                        icons: _listIconTabToggle,
                        selectedLabelIndex: (index) {


                          setState(() {
                            _tabIconIndexSelected = index;
                            if(_tabIconIndexSelected == 0){
                              isDarkMode = false;
                            }
                            else {
                              isDarkMode = true;
                            }
                          });
                          isDarkMode // call the functions
                              ? themeProvider.setDarkmode()
                              : themeProvider.setLightMode();
                          index = themeProvider.idTheme;
                        },
                        marginSelected:
                        EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                        selectedBackgroundColors: [
                          Theme.of(context).primaryColor,
                        ],
                        isShadowEnable: false,
                      )
                    ],
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
                              hintText: "Typing at here",
                              icon: Image.asset("assets/images/search_icon.png")
                          ),
                        autofocus: false,

                      ),
                    ),
                      Container(
                        child: InkWell(
                          onTap: (){},
                          child: Icon(
                            Icons.shopping_bag_outlined,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            child: CarouselSlider(
                              items: _listBanner,
                              options: CarouselOptions(
                                height: 200,
                                viewportFraction: 1,
                                enableInfiniteScroll: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 3)

                              ),

                            ),
                          ),

                          Container(
                            margin: EdgeInsets.all(15),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ..._brand.map((String e) {
                                    return InkWell(
                                      onTap: (){
                                        setState(() {
                                          genreSelected = e;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(left: 3,right: 3),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          color:
                                          (
                                              genreSelected == e?Colors.grey:Theme.of(context).primaryColor
                                          ),
                                        ),
                                        child: Text(e,
                                          style: TextStyle(fontSize: 14,color: (genreSelected == e?Theme.of(context).primaryColor:Theme.of(context).shadowColor),fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ],
                              ),
                            ),
                          ),
                          ...listProduct,
                          // Container(
                          //     height: 500,
                          //     child: MasonryGridView.count(
                          //       crossAxisCount: 2,
                          //       mainAxisSpacing: 2,
                          //       crossAxisSpacing: 2,
                          //       itemCount: productProvider.list.length,
                          //       itemBuilder: (context, index) {
                          //         return Container(
                          //             padding: EdgeInsets.all(13),
                          //             decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(20),
                          //               color:
                          //               (
                          //                   Colors.white
                          //               ),
                          //             ),
                          //             child: Column(
                          //               crossAxisAlignment: CrossAxisAlignment.center,
                          //               children: [
                          //                 InkWell(
                          //                   onTap: (){
                          //                     // TODO
                          //                   },
                          //                   child: Container(
                          //                     child: Column(
                          //                       children: [
                          //                         Image(image: NetworkImage(productProvider.list[index].urlImage??""),height: (size.height - kToolbarHeight - 24) / 5,fit: BoxFit.contain),
                          //                         SizedBox(height: 20,),
                          //                         SizedBox(
                          //                           child: Text(productProvider.list[index].nameProduct??"",
                          //                             style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500),
                          //                             overflow: TextOverflow.ellipsis,
                          //                             maxLines: 2,
                          //                           ),
                          //                           height: 40,
                          //                         ),
                          //                         SizedBox(height: 4,),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 SizedBox(height: 10,),
                          //                 Row(
                          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //                   children: [
                          //                     Container(
                          //                       child: Row(
                          //                         children: [
                          //                           Text("\$",style: TextStyle(fontWeight: FontWeight.bold),),
                          //                           Text((1000).toString(),style: TextStyle(fontWeight: FontWeight.bold),)
                          //                         ],
                          //                       ),
                          //                     ),
                          //                     Container(
                          //                       width: itemWidth/3,
                          //                       height: itemHeight/10,
                          //                       child: ElevatedButton(
                          //                           style: ButtonStyle(
                          //                             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          //                               RoundedRectangleBorder(
                          //                                   borderRadius: BorderRadius.circular(40),
                          //                                   side: BorderSide(color: Colors.lightBlueAccent)
                          //                               ),
                          //
                          //                             ),
                          //                             backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
                          //                             foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          //
                          //                           ),
                          //                           onPressed: (){
                          //                             // TODO
                          //                           },
                          //                           child: Row(
                          //                             children: [
                          //                               Icon(Icons.add_shopping_cart,color: Colors.white,size: 14,),
                          //                             ],
                          //                             mainAxisAlignment: MainAxisAlignment.center,
                          //                           )
                          //
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ],
                          //             ),
                          //         );
                          //       },
                          //
                          //     ),
                          //   ),
                        ],
                      ),
                    ),
                  ),
                )
              ],

            ),
          ),
        ),
    );
  }
}
