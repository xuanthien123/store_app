import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingView extends StatefulWidget {


  @override
  State<SettingView> createState() => _SettingViewState();
}
const String kEmailNullError = "Please Enter your Email";
const String kShortEmailError = "Email is too short";
final RegExp kemailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kInvalidEmailError = "Please Enter Valid Email";
const String kUserNameNullError = "Please Enter your UserName";
const String kIDUserNullError = "Please Enter your IDUser";
const String kAddressNullError = "Please Enter your Address";
const String kPhoneNullError = "Please Enter your Phone Number";
// var email = "tony123_90874.coder@yahoo.co.in";
// bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email);
// var kemailtest = kemailValid.hasMatch(email);

class _SettingViewState extends State<SettingView> {
  var _formSetting = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme
            .of(context)
            .backgroundColor,
        body: SingleChildScrollView(
          child: Column(children: [
            blockTitle(),
            blockImage(),
            blockFormSetting(),

          ]),
        ),
      ),
    );
  }

  blockFormSetting() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        child: Form(
          key: _formSetting,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: const Text(
                    'UserName',
                    style: TextStyle(
                      fontSize: 15,
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10,),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return kUserNameNullError;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).primaryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10,),),
                      hintText: ''
                  ),
                ),
              ),
              Container(
                child: const Text(
                    'ID User',
                    style: TextStyle(
                      fontSize: 15,
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10,),
                child: Container(

                  height: 50,
                  width: 600,
                  decoration: new BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color.fromARGB(255, 123, 122, 122)),
                  ),
                  child: Center(
                    child: const Text(
                        'ID236',
                        style: TextStyle(
                          fontSize: 15,
                        )
                    ),
                  ),
                ),
              ),
              Container(
                child: const Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 15,
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10,),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return kAddressNullError;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).primaryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10,),),
                      hintText: ''
                  ),
                ),
              ),
              Container(
                child: const Text(
                    'Phone Number',
                    style: TextStyle(
                      fontSize: 15,
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10,),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return kPhoneNullError;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).primaryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10,),),
                      hintText: ''
                  ),
                ),
              ),
              Container(
                child: const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 15,
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10,),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return kEmailNullError;
                    }
                    else {
                      if (value.length < 5)
                        return kShortEmailError;
                      else {
                        if (kemailValid.hasMatch(value) != true) {
                          return kInvalidEmailError;
                        }
                      }
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).primaryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10,),),
                      hintText: ''
                  ),
                ),
              ),

              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  width: 320,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 81, 0)),
                    onPressed: () {
                      if (_formSetting.currentState!.validate()) {
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

  blockTitle() {
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
              Icons.arrow_back
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Text('Setting',
              style: TextStyle(
                fontSize: 20,

              ),

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

  blockImage() {
    return Container(
      width: double.infinity,
      child: Image.asset('assets/images/avatar.png', width: 200, height: 200,),
    );
  }
}
