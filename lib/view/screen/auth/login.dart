import 'package:flutter/material.dart';
import 'package:flutter_application_restaurant/controller/user_controller.dart';
import 'package:flutter_application_restaurant/core/functions/validation.dart';
import 'package:flutter_application_restaurant/view/screen/auth/register.dart';
import 'package:flutter_application_restaurant/view/screen/forget_password/forgetPassword.dart';
import 'package:flutter_application_restaurant/view/widget/auth/Buttonlogin.dart';
import 'package:flutter_application_restaurant/view/widget/auth/Textformlogin.dart';
import 'package:flutter_application_restaurant/view/widget/auth/alertExitApp.dart';
import 'package:flutter_application_restaurant/view/widget/auth/staticbodyLog.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;
  UserControllerImp cont= Get.put(UserControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  WillPopScope(
        onWillPop: alertExitApp,
        child:ListView(
         children:[ 
          Staticbodylog(),
          const SizedBox(height: 30,),
          Form(
           autovalidateMode: AutovalidateMode.disabled,
           key: cont.formstateLog,
           child: Column(
          children: [
        Textformlogin(
         validator:  (val) {
            return validInput(val!, 5, 100, "email");
                    },
          isNumber: false,
          mycontoller: cont.emailLog,
          text: "Email",
          iconData: Icons.email,
                            ),
        const SizedBox(height: 40,),
        GetBuilder<UserControllerImp>(
                      builder: (controller) =>   Textformlogin(
          validator:  (val) {
            return validInput(val!, 5, 30, "password");
                      },
          isNumber: false,
          mycontoller: cont.passwordLog,
          text: "Password",
          iconData: cont.isshowpassword ? Icons.visibility_off : Icons.visibility,
          obscureText: cont.isshowpassword,
          onTapIcon: () {
          cont.showPassword();
                           }, 
                            ),),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const  Text(
                  "Forget Password ?  ",
                   style: TextStyle(
                   fontSize: 17, fontWeight: FontWeight.bold,),
                                      ),
             GestureDetector(
            onTap: () {
              setState(() {
                isChecked = !isChecked; 
                Get.to(Forgetpassword());
              });
            },
            child: Container(
              width: 20, 
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(2),
                color: isChecked ? Colors.green : Colors.white, 
              ),
              child: isChecked
                  ? const Icon(Icons.check, color: Colors.white, size: 15)
                  : null,
            ),)
          
                    ],
                  ),
                ),
           const SizedBox(height: 30,),
                                //60
           Buttonlogin(
              text: 'Go ',
              onPressed: ()  {
                cont.checkLogin();
                              },
              color:  Color(0xFFFFFEE58),
                            ),
           const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Creat new account ?  ",
                   style: TextStyle(
                    fontSize: 19, fontWeight: FontWeight.bold),
                                ),
                  IconButton(
                      onPressed: (){
                        Get.to(Register());
                                }, 
                      icon:Icon( Icons.arrow_circle_right_outlined,size: 35,))
                              ],
                            ),
          ]),
       )
     ])
    ));
  }
}
