import 'package:flutter/material.dart';
import 'package:flutter_application_restaurant/core/functions/validation.dart';
import 'package:flutter_application_restaurant/view/widget/auth/Buttonlogin.dart';
import 'package:flutter_application_restaurant/view/widget/auth/Textformlogin.dart';
import 'package:flutter_application_restaurant/view/screen/auth/login.dart';
import 'package:get/get.dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:const Text('Creat New Password',
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
            SizedBox(height: size.height*0.03,),
            Image.asset('assets/new-password/reset.jpg',
              height: size.height*0.22,
              width: size.width*0.22,               
                ),
            const SizedBox(height: 40,),
            const Text(
              'Your new password must be differnt \n from previously used password',
              textAlign: TextAlign.center,
              style: TextStyle(
              color:Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20
             
              ),),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Divider(thickness: 2,color: Color(0xFFFFFEE58),),
      ),
            const SizedBox(height: 70),
            Textformlogin( text: 'Password',iconData: Icons.lock_outlined,mycontoller: null,isNumber: false,
               validator:  (val) {
                 return validInput(val!, 5, 30, "password");
                      },
                                       //   obscureText: cont.isshowpassword,
                       onTapIcon: () {
                    //  cont.showPassword();
                       },
                       
                      ),    const SizedBox(height: 40),
            Textformlogin(text: 'Confirm Password',iconData: Icons.lock_outlined,mycontoller: null,isNumber: false,
              validator:  (val) {
                return validInput(val!, 5, 30, "confirm password");
                      },
                 //  obscureText: cont.isshowpassword,
                     onTapIcon: () {
                    //cont.showPassword();
                     },
                    ),
           const SizedBox(height: 70),
           Buttonlogin(text: 'Save  ',onPressed: () {
             Get.to(Login());
          },
             color: Color(0xFFFFFEE58),
          )
          ,
          ]
        ) 
        );
  }
}