import 'package:flutter/material.dart';
import 'package:flutter_application_restaurant/core/static/onboardingstatic.dart';
import 'package:flutter_application_restaurant/view/screen/auth/login.dart';
import 'package:get/get.dart';

abstract class Onboardingcontroller extends GetxController{
  next();
  onPageChanged(int index); //لتفعل النقط مع تغير الصفحة
}
class OnboardingcontrollerImp extends Onboardingcontroller{
  late PageController pageController;
  //MyServices myServices = Get.find();
  int currentPage=0; 
  @override
  next() {
    currentPage++;
    if(currentPage > onBoardinglist.length - 1){ //هون رح ضيف فكرة انو هو شاف الصفحات وبدو يروح ل لوغ منعين انو شاف الصفحات
    //  myServices.sharedPreferences.setString('SplashScreen', "1"); //انو هون شافها
       Get.to( Login());
    }else{
      pageController.animateToPage(currentPage, duration: const Duration(milliseconds: 900), curve: Curves.easeInOut); //منحى انسيابي
    }
    
  }

  @override
  onPageChanged(int index) {
   currentPage=index;
   update();
  }
  @override
  void onInit(){ //للتحكم ب البيج فيو
    pageController=PageController();
    super.onInit();
  }
}