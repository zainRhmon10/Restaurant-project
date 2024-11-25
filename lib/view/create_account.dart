import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CreateAccount extends StatefulWidget {
  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
              Text('Create Account',style: TextStyle(fontSize: 35,letterSpacing: 3),),
              const SizedBox(height: 40),
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
              const SizedBox(height: 40),
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
              const SizedBox(height: 40),
              TextFormField(
                validator: (value3){
                  if(value3!=password.text)
                    return "password not match";
                  return null;
                },

                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Confirm password",
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
              MaterialButton(
                  onPressed: (){
                    if(formState.currentState!.validate()){
                      print("valid");
                      print(password);

                      Get.toNamed('/pinput_comp');
                      //if given code==my code
                    //  Get.toNamed('/home');
                    }
  }
                  ,child: Text('Register',style: TextStyle(fontSize: 20),),
                  ),
              Container(

                  child: MaterialButton(onPressed: (){
                    Get.toNamed('/login');
                  },child: Text("Already have an account?",style: TextStyle(fontSize: 20,color: Colors.blue,
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

