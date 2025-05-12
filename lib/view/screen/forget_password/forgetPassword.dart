import 'package:flutter/material.dart';
import 'package:flutter_application_restaurant/core/functions/validation.dart';
import 'package:flutter_application_restaurant/view/screen/forget_password/verifycode.dart';
import 'package:flutter_application_restaurant/view/widget/auth/Buttonlogin.dart';
import 'package:flutter_application_restaurant/view/widget/auth/Textformlogin.dart';
import 'package:get/get.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:const Text('Forget Password',
        style:  TextStyle(
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
            Image.asset('assets/new-password/forget.jpg',
                 height: size.height*0.22,
                width: size.width*0.22,               
                ),
            const SizedBox(height: 40,),
            const Text(
              'Please enter your email to Recieve \n  a Verification code',
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
          const SizedBox(height: 70),
          Textformlogin(text: 'Email',iconData: Icons.email_outlined,mycontoller: null,isNumber: false,
            validator:  (val) {
              return validInput(val!, 5, 100, "email");
                    },
          ),
          const SizedBox(height: 70),
          Buttonlogin(text: 'Send  ',onPressed: () {
            Get.to(Verifycode());
          },
          color: Color(0xFFFFFEE58),
          )
          ,
          ],
        ) );
  }
}