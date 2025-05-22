import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_application_restaurant/view/screen/auth/login.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class SplashScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.white,
      duration: 5000,
      splash:
        Container(
          child: 
            AspectRatio(
              aspectRatio: 100 / 2,
              child: Lottie.asset('assets/lotti/acceptSign.json',
              fit: BoxFit.fitWidth,
              height: 50,
              width: 50
                     ),
                   ),
                  
                
              ),
      nextScreen: Login(),
    );
  }

}