import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../model/detailProduct_Model.dart';

class Rating extends StatelessWidget {
  const Rating({Key? key, this.data}) : super(key: key);
  final List<CommentRate>? data;
  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: EdgeInsets.all(15),

      child:
      Container(
        height: 100,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Colors.white),
        ),

        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

             Text(AverageRating(data)>0 ? AverageRating(data).toString()+'/5': "0/5",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              Text("Based on "+ (data!.length.toString()=='0' ? 0.toString() : data!.length.toString())+" reviews",style: TextStyle(color:Colors.black.withOpacity(0.25),fontWeight: FontWeight.bold),),

            ],

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Visibility(
                visible: true,
                child:Padding(
                  padding:const EdgeInsets.all(3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RatingBar.builder(
                        ignoreGestures: true,
                        itemSize: 30,
                        initialRating: AverageRating(data),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        glow:false,
                        glowColor:Colors.grey,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
                        itemBuilder: (context, _) =>const Icon(
                          Icons.star_outlined,
                          color: Colors.amber,
                          size: 2,
                        ),
                        onRatingUpdate: (rating) {

                        },
                      ),
                    ],
                  ),
                ) ,
              ),

            ],
          )
        ],
      ),

    ),);
  }
  double AverageRating(List<CommentRate>? list){
    double sub=0;
    if(list==null){
      return sub;
    }
    for(int i=0; i<list.length;i++){
      sub=list[i].Rate! + sub;
    }
    return sub/(double.parse(list.length.toString()));
  }
}
