import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).backgroundColor,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Theme.of(context).shadowColor,
            ),
          ),
          title: (Text(
            "Notifications",
            style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400, color: Theme.of(context).shadowColor,),
          )),
          actions: [
          ],
          bottom: TabBar(
            labelColor: Theme.of(context).shadowColor,
            unselectedLabelColor: Colors.grey[400],
            indicatorColor: Colors.amber.shade900,
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Genaral (3)",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,

                  ),
                ),

              ),
              Tab(
                child: Text(
                  "Recommendations (2)",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,

                  ),
                ),
              ),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            Center(
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 13,
                        bottom: 2,
                        right: 22,
                        left: 22
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,

                    ),
                    height: 40,
                    child: const Text(
                      "All",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [

                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10),
                           
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Tin Khuy???n m??i",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(255, 15, 107, 244),

                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: const [
                                        Text(
                                          "M??a sale ????? b???, FPT Shop ??u ????i ???c???c kh???ng???",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "v???i ??u ????i l??n ?????n 90% cho nhi???u s???n ph???m.  ",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: const Text(
                                        "3h ago",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey
                                        ),
                                      ),
                                    ),

                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1.5, color: Colors.black),
                            ),
                          ),
                          height: 20,
                        ),
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10),

                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Tin Khuy???n m??i",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(255, 15, 107, 244),

                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: const [
                                        Text(
                                          "M??a sale ????? b???, FPT Shop ??u ????i ???c???c kh???ng???",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "v???i ??u ????i l??n ?????n 90% cho nhi???u s???n ph???m. ",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: const Text(
                                        "3h ago",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey
                                        ),
                                      ),
                                    ),

                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1.5, color: Colors.black),
                            ),
                          ),
                          height: 20,
                        ),
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10),

                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Tin Khuy???n m??i",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(255, 15, 107, 244),

                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: const [
                                        Text(
                                          "M??a sale ????? b???, FPT Shop ??u ????i ???c???c kh???ng???",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "v???i ??u ????i l??n ?????n 90% cho nhi???u s???n ph???m.  ",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: const Text(
                                        "3h ago",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey
                                        ),
                                      ),
                                    ),

                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1.5, color: Colors.black),
                            ),
                          ),
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 13,
                        bottom: 2,
                        right: 22,
                        left: 22
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,

                    ),
                    height: 40,
                    child: const Text(
                      "Today",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [

                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10),

                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Tin Khuy???n m??i",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(255, 15, 107, 244),

                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: const [
                                        Text(
                                          "Back Friday si??u bung n??? t???i FPT Shop v???i",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "h??ng ng??n s???n ph???m gi???m ???s???c??? ?????n 60%:",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: const Text(
                                        "1h ago",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey
                                        ),
                                      ),
                                    ),

                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1.5, color: Colors.black),
                            ),
                          ),
                          height: 20,
                        ),
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10),

                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Tin Khuy???n m??i",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(255, 15, 107, 244),

                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: const [
                                        Text(
                                          "Back Friday si??u bung n??? t???i FPT Shop v???i",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "h??ng ng??n s???n ph???m gi???m ???s???c??? ?????n 60%:",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: const Text(
                                        "1h ago",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey
                                        ),
                                      ),
                                    ),

                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1.5, color: Colors.black),
                            ),
                          ),
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
           /* Center(
              child: Text("Deliverd"),
            ),*/
          ],
        ),
      ),
    );
  }
}
