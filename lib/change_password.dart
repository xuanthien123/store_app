import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'function/for_ui.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}
const String kOlderPassNullError = "Please Enter your Older Password";
const String kMatchOlderPassEror = "Passwords don't match";
const String kShortOlderPassError = "Older Password is too short";
const String kOlderPassInvalidError = "Please Enter Valid Older Password";
const String kNewPassNullError = "Please Enter your New Password";
const String kShortNewPassError = "New Password is too short";
const String kNewPassInvalidError = "Please Enter Valid New Password";
const String kRetypeNewPassNullError = "Please Enter your Retype New Password";
const String kRetypeShortNewPassError = "Retype New Password is too short";
const String kRetypeNewPassInvalidError = "Please Enter Valid Retype New Password";
final RegExp passwordValidatorRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
class _ChangePasswordState extends State<ChangePassword> {
  var _formRegister = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: blockTitle(),
                  ),
                  Container(
                    child: blockImage(),
                  ),
                  Container(
                    child: blockForm(),
                  ),


              ]),
            ),
          ),
        ),
    );
  }
  blockForm(){
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        child: Form(
          key: _formRegister,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: const Text(
                    'Older Password',
                    style: TextStyle(
                      fontSize: 15,
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only( top: 10,bottom: 10,),
                child: TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return kOlderPassNullError;
                    }
                    else{
                      if(value.length < 5){
                        return kShortOlderPassError;
                      }
                      else{
                        if(passwordValidatorRegex.hasMatch(value) != true){
                          return kOlderPassInvalidError;
                        }
                      }
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      filled:true,
                      fillColor: Theme.of(context).primaryColor,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10,),),
                      hintText: ''
                  ),
                ),
              ),
              Container(
                child: const Text(
                    'New Password',
                    style: TextStyle(
                      fontSize: 15,
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10,),
                child: TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return kNewPassNullError;
                    }
                    else{
                      if(value.length < 5){
                        return kShortNewPassError;
                      }
                      else{
                        if(passwordValidatorRegex.hasMatch(value) != true){
                          return kNewPassInvalidError;
                        }
                      }
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      filled:true,
                      fillColor: Theme.of(context).primaryColor,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10,),),
                      hintText: ''
                  ),
                ),
              ),
              Container(
                child: const Text(
                    'Retype New Password',
                    style: TextStyle(
                      fontSize: 15,
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10,),

                child: TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return kRetypeNewPassNullError;
                    }
                    else{
                      if(value.length < 5){
                        return kRetypeShortNewPassError;
                      }
                      else{
                        if(passwordValidatorRegex.hasMatch(value) != true){
                          return kRetypeNewPassInvalidError;
                        }
                      }
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      filled:true,
                      fillColor: Theme.of(context).primaryColor,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10,),),
                      hintText: ''
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  width: 320,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 81, 0)),
                    onPressed: () {
                      if (_formRegister.currentState!.validate()) {

                        // Form OK

                      }
                      else {
                        // Form not OK
                      }
                    },
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Save Change',
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
              ),

            ],
          ),
        ),
      ),
    );
  }
  blockTitle(){
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
          Text("Change Password",
            style: TextStyle(
              fontSize: 20,

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
  blockImage(){
    return Container(
      width: double.infinity,
      child: Image.asset('assets/images/changepassword.png', width: 200, height: 200,),
    );
  }

}