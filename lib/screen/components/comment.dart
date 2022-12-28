import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screen/spash/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../model/detailProduct_Model.dart';
class Comment extends StatefulWidget {
  const Comment({Key? key, required this.data}) : super(key: key);
  final List<CommentRate> data;
  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  bool isVisible = false;
  double heightreviews = 64;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Padding(padding: EdgeInsets.all(10),
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
      /*  Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(width: 10,),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>TestMe(data: widget.data)));
            }, child: Text("Reviews"),),
          ],
        ),*/
    Container(
      constraints: BoxConstraints(
        maxHeight: double.infinity,
      ),
      width: 500,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Colors.black38),
          bottom: BorderSide(width: 1.0, color: Colors.black38),
        ),
      ),
      child:SizedBox(
        width: 208,
        height: heightreviews,
        child: TextButton(
          style: TextButton.styleFrom(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            primary: Colors.white,
            backgroundColor: hexToColor("#F3F3F3"),
          ),
          onPressed:() {
            if(isVisible==true){
              setState(
                    () {
                      heightreviews=64;
                      isVisible = false;
                },
              );
          }
          else{
              setState(
                    () {
                      heightreviews=280;
                  isVisible = true;
                },
              );
          }

    },
          child:
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 10),
                        child:
                            Row(
                              children: [
                                Text("Add Review",textAlign: TextAlign.left,style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                                IconButton(onPressed: (){}, icon:Icon(Icons.add_comment_outlined,color: Colors.black,),)

                              ],
                            )

                      )],
                  ),
                  buildAddComment(context,isVisible)
                ],
              )
              )
        ),
      ),
       Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: 18),
            child:Text("User reviews",textAlign: TextAlign.left,style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            ),

           widget.data.length==0 ? Container(
             padding: EdgeInsets.all(100),
              child: Text("No Comment",textAlign: TextAlign.center,style: TextStyle(fontSize: 30),),
            ) : Column( children: [
             ...List.generate( widget.data.length,
                     (index) =>  buildCommentWidget(index)),

    ],
    )
          ],
        )
   ]));
  }
  Widget buildAddComment(BuildContext context,status){
return(
Visibility(
  visible: status,
  child:Padding(
    padding:const EdgeInsets.all(5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RatingBar.builder(
          initialRating: 2.5,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          glow:false,
        glowColor:Colors.grey,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) =>const Icon(
            Icons.star_outlined,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {

          },
        ), const SizedBox(
          height: 15.0,),
        buildFormValidate(context),
      ],
    ),
  ) ,
)

);}
  Widget buildFormValidate(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100.0,
            child:
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                  isDense: true,
                  border:OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1)),
                  hintText: 'Typing here'
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty ) {
                  return 'Please enter some text';
                }
                if(value.length>50){
                  return 'Too much';
                }
                return null;
              },
            ),),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: hexToColor("#F44C0F")),
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildCommentWidget (index){

    return Padding(padding:  EdgeInsets.all(15),
      child:Container(
        constraints: BoxConstraints(
          maxHeight: double.infinity,
        ),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              color: Colors.white),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child:  CircleAvatar(

                    radius: 48,
                    // Image radiusAssetImage("assets/images/store_1.png")
                    backgroundImage: AssetImage('assets/images/image_not_found.png'),
                  ),
                ),
                SizedBox(  width: 10.0,
                  height: 10.0,),

                Text( widget.data[index].IDUser.toString(),style: TextStyle(fontSize: 12),),
                SizedBox(  width: 10.0,
                  height: 10.0,),
                Text( widget.data[index].CommentDate.toString()
                  ,style: TextStyle(fontSize: 10,color: Colors.black.withOpacity(0.25)),),
                SizedBox(  width: 10.0,
                  height: 10.0,),
                Row(
                  children: [
                    ...List.generate(int.parse(widget.data[index].Rate.toString()),
                            (index) =>Icon(Icons.star_purple500_sharp,color: Colors.yellowAccent,size: 20,)),


                  ],
                ),
              ],
            ),    SizedBox(  width: 10.0,
              height: 10.0,),

            Text(widget.data[index].Content.toString(),style: TextStyle(fontSize: 10,color: Colors.black.withOpacity(0.25)),textAlign: TextAlign.left),
          ],
        ),
      ),


    );
  }



}




