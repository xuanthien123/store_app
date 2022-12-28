import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:store_app/function/for_ui.dart';
import 'package:store_app/provider/cartProvider.dart';
import 'package:store_app/provider/user_provider.dart';

import 'model/cartModels.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

List<Cart> data=[];
class _MyCartState extends State<MyCart> {
  @override
 /* void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      asyncMethod(context);
    });
    // TODO: implement initState
    super.initState(
    );
  }*/
  @override
  Widget build(BuildContext context) {
var userProvider = Provider.of<UserProvider>(context);
asyncMethod(context, userProvider.user.idUser!);
    return
      Scaffold(
        backgroundColor: ForUI.hexToColor("#F3F3F3"),
        body: SingleChildScrollView(
              child: Column(
                  children: [
                blockTi(),
                blockItems(),
               ...List.generate( data.length,
                      (index) =>   blockProduct(index),  ),
                blockPromoCodes(),
                blockCodes(),
                const SizedBox(height: 20,),
                blockTotalButton()
              ]),
        ),
      );

  }
/*  int SumTotal(List<Cart>){

  }*/
  //block
  blockTi(){
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
          Text("My Cart",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,

            ),

          ),
          Text("",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,

            ),

          ),
        ],
      ),
    );
  }

  void asyncMethod(BuildContext context,int index) async {
    var check=await checkData.fetchData(index);
    setState(() {
      data=check;
    });
  }
  blockItems(){
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Image.asset('images/items.png', width: 24, height: 24,),

            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Items",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,

                  ),

                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
  double sumtotal(List<Cart> list){
    double sum=0;
    for(int i=0; i<list.length;i++){
      sum=double.parse(list[i].quantity.toString())*list[i].price;
    }
    return sum;
  }
  blockProduct(int index){

    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Image.network(data[index].urlImage.toString(), width: 75, height: 75,),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(data[index].nameProduct, maxLines: 2,

                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                Text(data[index].specificationProduct+"-"+data[index].colorName,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,

                  ),
                ),
                Text(data[index].price.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 81, 0),
                  ),
                )

              ],
            ),
          ),Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(

                  child: Padding(
                    padding: const EdgeInsets.only(bottom:5.0),
                    child: ElevatedButton(
                      style:
                      TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0.0,
                        shadowColor: Colors.white,
                      ),
                      onPressed: () {
                        print("alo ao");
                      },
                      child: Image.asset('images/delete.png', width: 20, height: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  decoration: new BoxDecoration(
                    color: Color.fromARGB(255, 255, 81, 0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 30,
                        height: 20,

                        child:ElevatedButton(
                          style: TextButton.styleFrom(backgroundColor:  Color.fromARGB(255, 255, 81, 0), elevation: 0.0, shadowColor: Colors.white, ),
                          onPressed: (){},  child: Center(
                          child: Text("-", style: TextStyle(color: Colors.white),
                          ),
                        ),
                          //Text("-", style: TextStyle(color: Colors.white, ),),
                        ),),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(data[index].quantity.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: 30,

                        child: Padding(
                          padding: const EdgeInsets.only(right:0.0),
                          child: ElevatedButton(
                            style: TextButton.styleFrom(backgroundColor:  Color.fromARGB(255, 255, 81, 0), elevation: 0.0, shadowColor: Colors.white, ),
                            onPressed: () {},
                            child: Center(
                              child: Text("+", style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),

                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
  blockPromoCodes(){
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Image.asset('images/promo_code.png', width: 24, height: 24,),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Promo Codes",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,

                  ),

                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
  blockCodes(){
    return  Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            width: 270.0,
            height: 35,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter promo codes',
              ),
              style: TextStyle(fontSize: 15.0, height: 2.5, color: Colors.black,),
            ),
          ),

          Container(
            child: Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: ElevatedButton(
                style: TextButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 81, 0)),
                onPressed: () {},
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,

                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  blockTotalButton(){
    return  Container(
      width: double.infinity,
      decoration: BoxDecoration(

          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )
      ),

      child: Padding(
        padding: const EdgeInsets.all(00.0),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,

                          ),
                        ),
                        Container(
                          width:120,
                          child:
                          GradientText(
                            sumtotal(data).toString(),
                            style: Theme.of(context).textTheme.headline6,
                            gradient: LinearGradient(colors: [
                              Colors.deepOrange.shade500,
                              Colors.yellow.shade500,
                            ]),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: ElevatedButton(
                        style: TextButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 81, 0)),
                        onPressed: () {  },
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Proceed Checkout',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),


                ],

              ),
            ) ,),
    );
  }

}
class GradientText extends StatelessWidget {
  const GradientText(
      this.text, {
        required this.gradient,
        this.style,
      });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }



}

