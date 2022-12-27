import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/forgot_pass_screen.dart';
import 'package:store_app/provider/user_provider.dart';
import 'package:store_app/signup_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool wrongPassword = false;
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
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
                margin: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),
                          Container(
                            child: TextFormField(
                              controller: _userName,
                              validator: (value){
                                if (value == null || value.isEmpty)
                                  return "Vui lòng nhập email đăng nhập";
                                return null;
                              },
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.email,
                                ),
                                hintText: 'Email',
                              ),
                            ),
                          ),


                          const SizedBox(height: 10),
                          Container(
                            child: TextFormField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: _password,
                              validator: (value){
                                if (value == null || value.isEmpty)
                                  return "Vui lòng nhập mật khẩu";
                                if (wrongPassword == true)
                                  return "Tài khoản hoặc mật khẩu không chính xác";
                                return null;
                              },
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                                hintText: 'Password',
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 10,0,0),
                              child: Align (
                                  alignment: Alignment.center,
                                  child: TextButton  (
                                      child: Text("Forgot Password ?",
                                        style: TextStyle(
                                          color: const Color.fromARGB(255, 244, 76, 15),

                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const ForgotPassScreen())
                                        );
                                      }
                                  )
                              )
                          ),

                          const SizedBox(height: 20),
                          InkWell(
                            onTap: () async {
                              wrongPassword = false;
                              if (_formKey.currentState!.validate()){
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(left: 120,right: 120,top: 312,bottom: 312),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Theme.of(context).backgroundColor,
                                          ),
                                        child: const Center(child: CircularProgressIndicator())
                                      );
                                    });
                                int a = await userProvider.loginUser(_userName.text, _password.text);
                                Navigator.pop(context);
                                if(a == 0){
                                  wrongPassword = true;
                                  _formKey.currentState!.validate();
                                }
                                else{
                                  wrongPassword = false;
                                }
                              }

                              if(userProvider.user.email != null){
                                Navigator.pop(context);
                              }
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromARGB(255, 244, 76, 15),
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
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
                                          "Don't have account!"
                                      ),
                                      TextButton  (
                                          child: Text("Register.",
                                            style: TextStyle(
                                              color: const Color.fromARGB(255, 244, 76, 15),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => const SignUpScreen())
                                            );
                                          }
                                      ),
                                    ],
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