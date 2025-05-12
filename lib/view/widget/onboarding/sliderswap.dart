import 'package:flutter/material.dart';
import 'package:flutter_application_restaurant/controller/onboardingController.dart';
import 'package:flutter_application_restaurant/core/static/onboardingstatic.dart';
import 'package:get/get.dart';

class Sliderswap extends GetView<OnboardingcontrollerImp> {
  const Sliderswap({super.key}) ;

  @override
  Widget build(BuildContext context) {
    
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardinglist.length,
      itemBuilder: (context , i ) => Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40),
          width: 500,
          height: 300,
          child:Image.asset(onBoardinglist[i].image,
                   ),
                    ),
        const SizedBox(height: 20,),
        Text(
          onBoardinglist[i].title,
          textAlign: TextAlign.center,
          style:const TextStyle(
          fontFamily: 'Georgia',
          fontSize: 25
                                  ),
                                ),
        const SizedBox(height: 20,),
        Text(
          onBoardinglist[i].body,
          textAlign: TextAlign.center,
          style:const TextStyle(
          fontSize: 15,
          fontFamily: 'Cairo',
          color: Colors.black54
                                  ),
                                ),
                              ],
                            ),
                           
                         );
  }
}