import 'package:flutter/material.dart';
import 'package:flutter_application_restaurant/controller/user_controller.dart';
import 'package:flutter_application_restaurant/core/functions/validation.dart';
import 'package:flutter_application_restaurant/view/widget/auth/Buttonlogin.dart';
import 'package:flutter_application_restaurant/view/widget/auth/Textformlogin.dart';
import 'package:flutter_application_restaurant/view/widget/auth/staticBidyRegister.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
   Register({super.key});
  UserControllerImp cont= Get.put(UserControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
         children: [
        Staticbidyregister(),
         Form(
            autovalidateMode: AutovalidateMode.disabled,
            key: cont.formStatereg,
            child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Textformlogin(text: 'User Name',iconData: Icons.person ,mycontoller: cont.username,isNumber: false,
                validator: (val) {
                  return validInput(val!, 3, 20, "username");
                        },
                        ),                
              const SizedBox(height: 40),
              Textformlogin(text: 'Phone Number',iconData: Icons.phone_android_outlined,mycontoller: cont.phone,isNumber: true,  
                validator: (val) {
                   return validInput(val!, 7, 11, "phone");
                        },
                        ),
              const SizedBox(height: 40), 
              Textformlogin(
                validator:  (val) {
                  return validInput(val!, 5, 100, "email");
                          },
                isNumber: false,
                mycontoller: cont.email,
                text: "Email",
                iconData: Icons.email,
                                  ),
              const SizedBox(height: 40),       
              Textformlogin(text: 'Location Area',iconData: Icons.location_on,mycontoller: cont.location,isNumber: false,
                        ),
              const SizedBox(height: 40),
             GetBuilder<UserControllerImp>(
               builder: (controller) => Textformlogin( text: 'Password',iconData:cont.isshowpassword ? Icons.visibility_off : Icons.visibility,mycontoller: cont.password,isNumber: false,
                validator:  (val) {
                  return validInput(val!, 5, 30, "password");
                            },
                 obscureText: cont.isshowpassword,
                onTapIcon: () {
                cont.showPassword();
                           },     
                        ),),
              const SizedBox(height: 40),
             GetBuilder<UserControllerImp>(
              builder: (controller) => Textformlogin(text: 'Confirm Password',iconData: cont.isshowpassword ? Icons.visibility_off : Icons.visibility,mycontoller: cont.conpassword,isNumber: false,
              validator:  (val) {
              return validInput(val!, 5, 30, "password");
                            },
               obscureText: cont.isshowpassword,
                onTapIcon: () {
                cont.showPassword();
                           }, 
                          ),),
              const SizedBox(height: 40),
              Buttonlogin(
                text: 'Done ',
                onPressed: ()  {
                  // Get.to(Signup());
                cont.checkSignUP();
                                  },
                color:  Color(0xFFFFFEE58),
                                ),
                         ]  ),
                     ),
        
                     ]),
      ),
    );
                  
            
    
    
    
    
      
  }
}

  
