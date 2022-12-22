import 'package:flutter/material.dart';
class DetailOrder extends StatelessWidget {
  const DetailOrder({Key? key}) : super(key: key);

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
              Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 5,top: 5),
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Order No0175",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                              Text(
                                "Delivered",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  color: Colors.deepOrange
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5,top: 5),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "17-12-2021 12:12:12",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5,top: 25),
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
                          margin: const EdgeInsets.only(bottom: 5,top: 5),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Phu Dien Town,Phu Vang District, Hue City",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5,top: 25),
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
                          margin: const EdgeInsets.only(bottom: 5,top: 5),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Tran Xuan Thien",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5,top: 25),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Phone",
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
                            "0977995821",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5,top: 25),
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
                          margin: const EdgeInsets.only(bottom: 5,top: 5),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "xuanthien8501@gmail.com",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5,top: 25),
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
                          margin: const EdgeInsets.only(bottom: 5,top: 5),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "is simply dummy text of the printing and",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey
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
                              "Re-Order",
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
            ],
          ),
        ),
      ),
    );
  }
}
