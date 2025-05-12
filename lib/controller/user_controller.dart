import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class User_Controller extends GetxController {
  checkLogin();
  checkSignUP();
}
class UserControllerImp extends User_Controller {
  final GlobalKey<FormState> formStatereg = GlobalKey<FormState>();
  final GlobalKey<FormState> formstateLog = GlobalKey<FormState>();
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController conpassword;
  late TextEditingController location;
  late TextEditingController email;
  late TextEditingController emailLog;
  late TextEditingController passwordLog;

 bool isshowpassword = true;

  showPassword() {
    isshowpassword = !isshowpassword;
    update();
  }
  @override
  checkLogin(){
    var formdata = formstateLog.currentState;
    if (formdata!.validate()) {
      Get.snackbar('Succsess log in','Welcome dear ',icon: Icon(Icons.tag_faces_rounded,color: Colors.black),);
    } else {
      Get.snackbar('Failed log in','check your email and  password again ');
    }
  }

  @override
   checkSignUP(){
    if (formStatereg.currentState!.validate()) {
      Get.snackbar('Succsess creat acount','Welcome dear ',icon: Icon(Icons.tag_faces_rounded,color: Colors.black),);
    } else { 
      Get.snackbar('Failed creat acount','check your personal information again ');
    }
  
   }


  @override
  void onInit() {
    phone= TextEditingController();
    password = TextEditingController();
    passwordLog = TextEditingController();
    username= TextEditingController();
    conpassword = TextEditingController();
    location = TextEditingController() ; 
    email  = TextEditingController() ;
    emailLog  = TextEditingController() ;
    super.onInit();
  }

  @override
  void dispose() {
    phone.dispose();
    password.dispose();
    passwordLog.dispose();
    username.dispose();
    conpassword.dispose();
    location.dispose();
    email.dispose();
    emailLog.dispose();
    super.dispose();
  }


}