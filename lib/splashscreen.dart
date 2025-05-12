
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_application_restaurant/view/screen/onboarding/onboarding.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.white,
      duration: 4000,
      splash:
        Container(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                 "BiteBoss",
                  textStyle:const TextStyle(fontSize: 40, fontWeight: FontWeight.bold,backgroundColor: Colors.white),
                  colors: [ Color(0xFFFFA652), Colors.black87,Color(0xFFFFA652)]
                                 ),]
                                 ),
            AspectRatio(
              aspectRatio: 50 / 2,
              child: Lottie.asset('assets/lotti/متور.json',
              fit: BoxFit.fitWidth,
              height: 50,
              width: 50
                     ),
                   ),
                  
                ],)
              ),
      nextScreen: OnBoarding(),
    );
  }

}