import 'package:flutter/material.dart';
import 'package:flutter_application_restaurant/controller/auth/register_controller.dart';
import 'package:flutter_application_restaurant/data/services/auth/register/confirm_email_serv.dart';
import 'package:flutter_application_restaurant/splash_screen2.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
class Otp_confirm extends StatelessWidget {
  
   Otp_confirm({super.key});
  RegisterControllerImp cont =Get.find();
  @override
  Widget build(BuildContext context) {
    return  OtpTextField(
      fieldHeight: 50,
      fieldWidth: 50,
      borderRadius: BorderRadius.circular(10),
      numberOfFields: 6,
      focusedBorderColor: Colors.yellow, 
      textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold), 
          //set to true to show as box or false to show as dash
      showFieldAsBox: true, 
          //runs when a code is typed in
      onCodeChanged: (String code) {
              //handle validation or checks here           
          },
      onSubmit: (String verificationCode)async{
          if(cont.formstate.currentState!.validate()){
          bool success = await ConfirmEmailServ.confirm(cont.email.text,verificationCode);
            if (success) {
              Get.to(SplashScreen2());
            } 
  }
           // Get.to(Resetpassword());
          },
          
          
          //runs when every textfield is filled
        // end onSubmit
    );
  }
}



