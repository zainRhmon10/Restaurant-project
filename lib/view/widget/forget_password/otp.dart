import 'package:flutter/material.dart';
import 'package:flutter_application_restaurant/view/screen/forget_password/resetpassword.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
class Otp extends StatelessWidget {
  const Otp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  OtpTextField(
      fieldHeight: 40,
      fieldWidth: 40,
      borderRadius: BorderRadius.circular(10),
      numberOfFields: 6,
         // borderColor: const Color(0xFFFFFEE58),
      focusedBorderColor: Colors.yellow, // لون الحافة عند التركيز
     // enabledBorderColor: Colors.yellow, // لون الحافة عندما يكون الحقل نشط
      // نمط النص
      textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold), 
          //set to true to show as box or false to show as dash
      showFieldAsBox: true, 
          //runs when a code is typed in
      onCodeChanged: (String code) {
              //handle validation or checks here           
          },
      onSubmit: (String verificationCode){
           Get.to(Resetpassword());
          }
          //runs when every textfield is filled
        // end onSubmit
    );
  }
}



