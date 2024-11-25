import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'create_account.dart';

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);
  TextEditingController phoneNumber = TextEditingController();

  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formState=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100,left: 50,right: 50,bottom: 50),
        child: Form(
          key: formState,
          child: Column(
            children: [
              Text('Login',style: TextStyle(fontSize: 35,letterSpacing: 3),),
              const SizedBox(height: 20),
              TextFormField(
                controller:phoneNumber,
                validator: (value){

                  if(value!.length<10)
                    return 'phone-number should be at least 10 digits';
                  return null;
                },
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Enter your phone number",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller:password,
                validator: (value){

                  if(value!.length<8)
                    return 'password should be at least 8 characters';
                  return null;
                },

                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Enter your password",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const SizedBox(height: 20),
              MaterialButton(
                onPressed: (){
                  if(formState.currentState!.validate()){
                    print("valid");
                    print(password);
                    Get.toNamed('/home');
                  }
                }
                ,child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text('login',style: TextStyle(fontSize: 20),), Icon(Icons.arrow_right_alt_sharp,size: 40,),]),
              ),
              Container(

                  child: MaterialButton(onPressed: (){
                    Get.toNamed('/create_account');
                  },child: Text("Don't have an account?",style: TextStyle(fontSize: 20,color: Colors.blue,
                  ),))
              )
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: CreateAccount()));
