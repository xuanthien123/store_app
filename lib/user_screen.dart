import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/change_password.dart';
import 'package:store_app/provider/user_provider.dart';
import 'package:store_app/setting.dart';

import 'function/for_ui.dart';
import 'login_screen.dart';
class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<UserProvider>(context);
    if(productProvider.user.email == null){
      return notLogin(context);
    }
    else{
      return userScreenMain(context, productProvider);
    }
  }
}

Widget userScreenMain(BuildContext context, UserProvider userProvider) {
  return SafeArea(
    child: Container(
      color: Theme.of(context).backgroundColor,
      child: Column(children: [
        const SizedBox(height: 30,),
        blockAvatar(),
        const SizedBox(height: 30,),
        blockUserName(userProvider.user.userName!),
        Expanded(child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: ForUI.hexToColor("#F3F3F3"),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )
          ),
          child: Container(
            color: Theme.of(context).backgroundColor,
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            color: Theme.of(context).primaryColor
                        ),
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Profile",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ChangePassword())
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          color: Theme.of(context).primaryColor
                        ),
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Change Password",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SettingView())
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            color: Theme.of(context).primaryColor
                        ),
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Setting",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 150,),
                    blockButtonLogout(userProvider),


                  ],

                ) ),),
        ))
      ]),
    ),
  );
}

Widget notLogin(BuildContext context) {
  return SafeArea(
    child: Container(
      color: Theme.of(context).backgroundColor,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 30,),
          blockAvatar(),
          const SizedBox(height: 30,),
          blockUserName(""),
          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen())
              );
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: const Color.fromARGB(255, 244, 76, 15),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
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
        ],
      ),
    ),
  );
}

blockAvatar(){
  return Container(
    width: double.infinity,
    child: Image.asset('assets/images/avatar.png', width: 150, height: 150,),
  );
}
blockUserName(String nameUser){
  return Container(
    margin: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(nameUser ,
          style: const TextStyle(
            fontSize: 25,

          ),

        ),
      ],
    ),
  );
}

blockButtonLogout(UserProvider userProvider ){
  return Container(
    child: ElevatedButton(
      style: TextButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 81, 0)),
      onPressed: () { userProvider.logoutUser(); },
      child: Container(
        height: 50,
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Logout',
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
  );
}
