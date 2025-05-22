import 'package:flutter/material.dart';
import 'package:flutter_application_restaurant/controller/auth/reset_controller.dart';
import 'package:flutter_application_restaurant/core/functions/validation.dart';
import 'package:flutter_application_restaurant/data/services/auth/login/forget_password/reset_serv.dart';
import 'package:flutter_application_restaurant/view/widget/auth/login/button_login.dart';
import 'package:flutter_application_restaurant/view/widget/auth/login/textform_login.dart';
import 'package:flutter_application_restaurant/view/screen/auth/login.dart';
import 'package:get/get.dart';

class Resetpassword extends StatefulWidget {
  const Resetpassword({super.key});

  @override
  State<Resetpassword> createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
      bool isChecked = false;
    ResetControllerImp cont =Get.put(ResetControllerImp());
   
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
            Form(
              autovalidateMode: AutovalidateMode.disabled,
           key: cont.formstate,
              child: Column(
                children: [
              
             GetBuilder<ResetControllerImp>(
               builder: (controller) => Textformlogin( 
                text: 'Password',
                iconData:cont.isshowpassword ? Icons.visibility_off : Icons.visibility,
                mycontoller: cont.password,
                isNumber: false,
                validator:  (val) {
                  return validInput(val!, 5, 30, "password");
                            },
                 obscureText: cont.isshowpassword,
                onTapIcon: () {
                cont.showPassword();
                           },     
                        ),),
               const SizedBox(height: 40),
            GetBuilder<ResetControllerImp>(
               builder: (controller) => Textformlogin(
                text: 'Confirm Password',
                iconData: cont.isshowpassword1 ? Icons.visibility_off : Icons.visibility,
                mycontoller: cont.password_confirmation,
                isNumber: false,
              validator:  (val) {
              return validInput(val!, 5, 30, "password");
                            },
               obscureText: cont.isshowpassword1,
                onTapIcon: () {
                cont.showPassword1();
                           }, 
                          ),),
                        const SizedBox(height: 20),
                        Padding(
                         padding: const EdgeInsets.only(right: 30),
                          child: Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             const  Text(
                               "Logout other devices   ",
                                style: TextStyle(
                                   fontSize: 17, fontWeight: FontWeight.bold,),
                                          ),
                                         GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isChecked = !isChecked; 
                                            cont.logout_oth_dev=true;
                                           // Get.to(Forgetpassword());
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
                                            ?  Icon(Icons.check, color: Colors.white, size: 15)
                                            : null,
                                        ),)
                                                ],
                                              ),
                        ),
                         const SizedBox(height: 70),
                         Buttonlogin(
                          text: 'Save  ',
                         onPressed: () async{
                      if(cont.formstate.currentState!.validate()){
                    ResetServ resetFuncs = ResetServ();
                      bool success = await resetFuncs.reset(
                        cont.password.text,
                      cont.password_confirmation.text,
                      cont.logout_oth_dev,
                                    );
                      if (success) {
                        Get.to(Login());
                      } 
                      }
                        },
               color: Color(0xFFF5D64C),
                        )
                        ,
                        ]),
            )
          ]
        ) 
        );
  }
}