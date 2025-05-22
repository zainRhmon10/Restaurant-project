import 'package:flutter/material.dart';
import 'package:flutter_application_restaurant/controller/auth/login_controller.dart';
import 'package:flutter_application_restaurant/core/functions/validation.dart';
import 'package:flutter_application_restaurant/view/widget/auth/login/textform_login.dart';
import 'package:flutter_application_restaurant/view/widget/auth/forget_password/otp_verify.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Verifycode extends StatelessWidget {
   Verifycode ({super.key});
  LoginControllerImp cont= Get.put(LoginControllerImp());
  @override
   Widget build(BuildContext context) {
   final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        title:const Text('Verify Your Email',
        style: TextStyle(
              fontSize: 23,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        backgroundColor: Color(0xFFFFF9C4,
      ),),
        body: ListView(
          children: [
            SizedBox(height: size.height*0.08,),
            Image.asset('assets/new-password/verify.jpg',
                 height: size.height*0.25,
                width: size.width*0.25,               
                ),
            const SizedBox(height: 40,),
            const Text(
              'Please enter the digit code sent to \n  Your Email',
             textAlign: TextAlign.center,
             style: TextStyle(
              color:Colors.black,
             fontWeight: FontWeight.bold,
             fontSize: 20
             
              ),),
           const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Divider(thickness: 2,color: Color(0xFFFFFEE58),),
      ),
            const SizedBox(height: 40),
            Textformlogin(text: 'Email',iconData: Icons.email_outlined,mycontoller:cont.email ,isNumber: false,
            validator:  (val) {
              return validInput(val!, 5, 100, "email");
                    },
          ),
          const SizedBox(height: 40),
            Otp_verify(),
             SizedBox(height: 50,),
  //             Buttonlogin(
  //         text: 'Done ',
  //         color:  Color(0xFFFDD05C),
  //         onPressed: ()async{
  //            bool success = await VerifyFuncs.verify(cont.email.text,cont.OTP.text);
  //           if (success) {
  //   Get.to(Verifycode());
  // } else {
  //   Get.snackbar(
  //     'Error',
  //     'Wrong email',
  //     backgroundGradient: LinearGradient(colors: [Colors.red, Colors.white]),
  //     snackPosition: SnackPosition.BOTTOM,
  //   );
  // };
  //           Get.to(Resetpassword());
  //         },
  //        )















            // Container(
            //   child:
            //   Container(
            //       //     decoration: BoxDecoration(
            //       //   image: DecorationImage(
            //       //     image: AssetImage('assets/images/login/f1.jpg'),
            //       //     fit: BoxFit.fill, 
            //       //   ),
            //       // ),
            //       //     width: size.width,
            //       //     height: size.height,
            //           child: 
            //            ListView(
            //     children:[Verify(),]
            //   ),
              
            // ),
            // width: size.width,
            // height: size.height,
            //      ),
          ],
        ) );
  }
  }