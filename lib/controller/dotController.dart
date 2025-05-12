import 'package:flutter/material.dart';
import 'package:flutter_application_restaurant/controller/onboardingController.dart';
import 'package:flutter_application_restaurant/core/static/onboardingstatic.dart';
import 'package:get/get.dart';

class Dotcontroller extends StatelessWidget {
  const Dotcontroller({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<OnboardingcontrollerImp>(
      builder: (controller)=>Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ...List.generate(
              onBoardinglist.length,
              (index)=>AnimatedContainer(
              margin: const EdgeInsets.only(right: 5),
             duration: const Duration(milliseconds: 900,),
              width:controller.currentPage==index? 20 : 5,
              height: 6,
             decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 246, 228, 68),
                                                      ),
                                                      
                                                      
                                                      )
                                                    ),
                                                      ],
                                                    ),);
  }
}