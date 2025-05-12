import 'package:flutter/material.dart';
import 'package:flutter_application_restaurant/controller/dotController.dart';
import 'package:flutter_application_restaurant/controller/onboardingController.dart';
import 'package:flutter_application_restaurant/view/widget/onboarding/button.dart';
import 'package:flutter_application_restaurant/view/widget/onboarding/sliderswap.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingcontrollerImp());
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children:[ 
            Expanded(flex: 2,
              child: Sliderswap(),
                        ),
              SizedBox(height: 20,),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Dotcontroller(),
                    SizedBox(height: 50,),
                    Button(),
                                    ],
                                  ),
                                ),
                  ],
                )
                ),
    );
  }
}