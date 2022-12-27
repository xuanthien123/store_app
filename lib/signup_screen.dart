import 'package:flutter/material.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              // height: MediaQuery.of(context).size.height / 3.5,
              child: Image.asset('assets/images/LogoApp.png', width: 300, height: 300),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Container(
                          child: TextFormField(
                            controller: _email,
                            validator: (value){
                              if (value == null || value.isEmpty)
                                return "Vui lòng nhập email";
                              return null;
                            },
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.email,
                              ),
                              hintText: 'Email',
                              hintStyle: TextStyle(),
                            ),
                          ),
                        ),


                        Container(
                          child: TextFormField(
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            controller: _password,
                            validator: (value){
                              if (value == null || value.isEmpty)
                                return "Vui lòng nhập mật khẩu";
                              return null;
                            },
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.lock,
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(),
                            ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            controller: _confirmPassword,
                            validator: (value){
                              if (value == null || value.isEmpty)
                                return "Vui lòng nhập lại mật khẩu";
                              return null;
                            },
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.lock,
                              ),
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(),
                            ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            controller: _userName,
                            validator: (value){
                              if (value == null || value.isEmpty)
                                return "Vui lòng nhập tên tài khoản";
                              return null;
                            },
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.person,
                              ),
                              hintText: 'User Name',
                              hintStyle: TextStyle(),
                            ),
                          ),
                        ),
                        Align (
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "By Signing up, you are agree to out",
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  TextButton  (
                                      child: Text("Terms & Conditions",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: const Color.fromARGB(255, 244, 76, 15),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      onPressed: () {}
                                  ),
                                ],
                              ),

                            ),
                        Container(
                            child: Align (
                              alignment: Alignment.topLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("and",
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  TextButton  (
                                      child: Text("Privacy Plicy",
                                        style: TextStyle(
                                          color: const Color.fromARGB(255, 244, 76, 15),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                      onPressed: () {}
                                  ),
                                ],

                              ),

                            )
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromARGB(255, 244, 76, 15),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Joned us before?",
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  TextButton  (
                                      child: Text("Login",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: const Color.fromARGB(255, 244, 76, 15),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      onPressed: () {}
                                  ),
                                ],
                              ),

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