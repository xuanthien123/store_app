import 'package:flutter/material.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignUpScreen> {
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
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
                          'Sign up',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),
                        Container(
                          child: const TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              hintText: 'Email',
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
                        const SizedBox(height: 10),
                        Container(
                          child: const TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              hintText: 'User Name',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 10,0,0),
                            child: Align (
                                alignment: Alignment.center,
                                child: TextButton  (
                                    child: Text("By Signing up, you are agree to out Terms & Conditions and Privacy Plicy",
                                      style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {}
                                )
                            )
                        ),

                        const SizedBox(height: 20),
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
                                  'Sign up',
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
                        const SizedBox(height: 10),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 10,0,0),
                            child: Align (
                                alignment: Alignment.center,
                                child: TextButton  (
                                    child: Text("Joned us before? Login",
                                      style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {}
                                )
                            )
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