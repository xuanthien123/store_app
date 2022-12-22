import 'package:flutter/material.dart';


class SetNewPassScreen extends StatefulWidget {
  const SetNewPassScreen({super.key});

  @override
  State<SetNewPassScreen> createState() => _SetNewPassScreenState();
}

class _SetNewPassScreenState extends State<SetNewPassScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height / 3.5,
              child: Image.asset('assets/images/LogoApp.png', width: 300, height: 300),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Set new password',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 15),
                        Container(
                          child: Text(
                            "Your new password must ne different to peviously used password",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          child: const TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          child: const TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.orange,
                            ),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}