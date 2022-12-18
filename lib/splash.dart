
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:store_app/HomePage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';
class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/images/store_1.png"),
                  ),
                ],
              ),
            ),
            AnimatedSplashScreen(
              splash:
                  Lottie.asset("assets/images/loading.json"),
              backgroundColor: Colors.white,
              nextScreen: const HomePage(),
              pageTransitionType: PageTransitionType.fade,
            ),
          ],
        ),
    );
  }
}
