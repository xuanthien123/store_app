import 'package:flutter/material.dart';
import 'package:store_app/model/Cart_Model.dart';


class ProceedCheckout extends StatelessWidget {
  ProceedCheckout({Key? key}) : super(key: key);



  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _note = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final CartModel listProduct = CartModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).backgroundColor,
          padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_outlined)
                  ),
                  Container(
                    width: 240,
                    alignment: Alignment.center,
                    child: const Text(
                      "Proceed Checkout",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 5,top: 5),
                          alignment: Alignment.topLeft,
                          child: const Text(
                              "Name",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          padding: const EdgeInsets.only(left: 10),

                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.black,width: 1)
                          ),
                          child: TextFormField(
                            controller: _name,
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return "Please type in Name field";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "Type in your name...",
                              border: InputBorder.none
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5,top: 15),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Address",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          padding: const EdgeInsets.only(left: 10),

                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.black,width: 1)
                          ),
                          child: TextFormField(
                            controller: _address,
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return "Please type in Address field";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: "Type in your address...",
                                border: InputBorder.none
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5,top: 15),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Phone Number",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          padding: const EdgeInsets.only(left: 10),

                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.black,width: 1)
                          ),
                          child: TextFormField(
                            controller: _phoneNumber,
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return "Please type in Phone Number field";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: "Type in your phone number...",
                                border: InputBorder.none
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5,top: 15),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          padding: const EdgeInsets.only(left: 10),

                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.black,width: 1)
                          ),
                          child: TextFormField(
                            controller: _email,
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return "Please type in Email field";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: "Type in your email...",
                                border: InputBorder.none
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5,top: 15),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Note",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          padding: const EdgeInsets.only(left: 10),

                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.black,width: 1)
                          ),
                          child: TextFormField(
                            controller: _note,
                            decoration: const InputDecoration(
                                hintText: "You can write something or not...",
                                border: InputBorder.none
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5,top: 25),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Payment Method",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5,top: 5),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Cash after received",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              color: Colors.grey
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 15,top: 15),
                          height: 1,
                          color: Colors.deepOrange,
                        ),
                        Container(
                          // TODO: list gio hang
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 15,top: 15),
                          height: 1,
                          color: Colors.deepOrange,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Subtotal",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "50,000,000",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Shipping",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "50,000",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Promo codes",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "-50,000",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Total:",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "50,000,000",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            margin: const EdgeInsets.only(top: 35,bottom: 20),
                            height: 50,
                            width: 350,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            child: const Text(
                              "Order",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
