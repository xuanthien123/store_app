import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:store_app/product_detail.dart';

import '../model/product_model.dart';

class GetGridViewProduct {
  static List<Container> getGrid(BuildContext context,List<ProductModel> list){
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = 148 + (size.height - kToolbarHeight - 24) / 4.4;
    var formatter = NumberFormat('#,###');
    Shader linearGradient = LinearGradient(
        colors: <Color>[Colors.amber, Colors.red],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
    ).createShader(Rect.fromLTWH(0.0, 0.0, 1.0, 700.0));
    int productLength = list.length;
    List<Container> listProduct = [];
    int numberOfProductRow = (productLength)~/2;
    for(int i=0;i<numberOfProductRow;i++){
      listProduct.add(Container(
        margin: EdgeInsets.only(bottom: 15,left: 17),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 15),
              width: itemHeight/1.9,
              height: itemHeight/1.1,
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:
                (
                    Theme.of(context).primaryColor
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailScreen(id: list[i*2].idProduct??0))
                      );
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Image(image: NetworkImage(list[i*2].urlImage??""),height: (size.height - kToolbarHeight - 24) / 5,fit: BoxFit.contain),
                          SizedBox(height: 10,),
                          SizedBox(
                            child: Text(list[i*2].nameFactory??"",
                              style: TextStyle(fontSize: 16,color: Theme.of(context).shadowColor,fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            height: 20,
                          ),
                          SizedBox(
                            child: Text(list[i*2].nameProduct??"",
                              style: TextStyle(fontSize: 16,color: Theme.of(context).shadowColor,fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                            height: 35,
                          ),
                          SizedBox(height: 5,),
                          RatingBar.builder(
                            initialRating: list[i*2].rate??0.0,
                            minRating: 0.1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                            itemSize: 17,

                          ),
                          Text(formatter.format(list[i*2].price??0).toString(),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()..shader = linearGradient,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Container(
              width: itemHeight/1.9,
              height: itemHeight/1.1,
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:
                (
                    Theme.of(context).primaryColor
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailScreen(id: list[i*2+1].idProduct??0))
                      );
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Image(image: NetworkImage(list[i*2+1].urlImage??""),height: (size.height - kToolbarHeight - 24) / 5,fit: BoxFit.contain),
                          SizedBox(height: 10,),
                          SizedBox(
                            child: Text(list[i*2+1].nameFactory??"",
                              style: TextStyle(fontSize: 16,color: Theme.of(context).shadowColor,fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            height: 20,
                          ),
                          SizedBox(
                            child: Text(list[i*2+1].nameProduct??"",
                              style: TextStyle(fontSize: 16,color: Theme.of(context).shadowColor,fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                            height: 35,
                          ),
                          SizedBox(height: 5,),
                          RatingBar.builder(
                            initialRating: list[i*2+1].rate??0.0,
                            minRating: 0.1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                            itemSize: 17,

                          ),
                          Text(formatter.format(list[i*2+1].price??0).toString(),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()..shader = linearGradient,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ));
    }
    if(productLength % 2 != 0){
      listProduct.add(Container(
        margin: EdgeInsets.only(bottom: 15,left: 17),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 15),
              width: itemHeight/1.9,
              height: itemHeight/1.1,
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:
                (
                    Theme.of(context).primaryColor
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailScreen(id: list.last.idProduct??0))
                      );
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Image(image: NetworkImage(list.last.urlImage??""),height: (size.height - kToolbarHeight - 24) / 5,fit: BoxFit.contain),
                          SizedBox(height: 10,),
                          SizedBox(
                            child: Text(list.last.nameFactory??"",
                              style: TextStyle(fontSize: 16,color: Theme.of(context).shadowColor,fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            height: 20,
                          ),
                          SizedBox(
                            child: Text(list.last.nameProduct??"",
                              style: TextStyle(fontSize: 16,color: Theme.of(context).shadowColor,fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                            height: 35,
                          ),
                          SizedBox(height: 5,),
                          RatingBar.builder(
                            initialRating: list.last.rate??0.0,
                            minRating: 0.1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                            itemSize: 17,

                          ),
                          Text(formatter.format(list.last.price??0).toString(),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()..shader = linearGradient,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ));
    }
    return listProduct;
  }

  static GridView getGrid2(BuildContext context,List<ProductModel> list){
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = 148 + (size.height - kToolbarHeight - 24) / 4.4;
    var formatter = NumberFormat('#,###');
    Shader linearGradient = const LinearGradient(
        colors: <Color>[Colors.amber, Colors.red],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 1.0, 400.0));
    return GridView.count(
      padding: const EdgeInsets.all(15),
      childAspectRatio: 0.58,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      crossAxisCount: 2,
      children: [
        ...list.map((e) {
          return Container(
            height: 500,
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:
              (
                  Theme.of(context).primaryColor
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    // TODO
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Image(image: NetworkImage(e.urlImage??""),height: (size.height - kToolbarHeight - 24) / 5,fit: BoxFit.contain),
                        SizedBox(height: 10,),
                        SizedBox(
                          child: Text(e.nameFactory??"",
                            style: TextStyle(fontSize: 16,color: Theme.of(context).shadowColor,fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          height: 20,
                        ),
                        SizedBox(
                          child: Text(e.nameProduct??"",
                            style: TextStyle(fontSize: 16,color: Theme.of(context).shadowColor,fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                          height: 35,
                        ),
                        const SizedBox(height: 5,),
                        RatingBar.builder(
                          initialRating: e.rate??0.0,
                          minRating: 0.1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                          itemSize: 17,

                        ),
                        Text(formatter.format(e.price??0).toString(),
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..shader = linearGradient,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
          );
        }).toList()
      ],
    );
  }
}