import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delievery/MiddleWare/HomeMiddleWare.dart';
import 'package:order_delievery/view/AnimationPage.dart';
import 'package:order_delievery/view/pinputcomp.dart';
import 'package:order_delievery/view/create_account.dart';
import 'package:order_delievery/view/home.dart';
import 'package:order_delievery/view/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
SharedPreferences? userData;
void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  userData= await SharedPreferences.getInstance();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(


      title: 'Flutter Demo',
      theme: ThemeData(

    textTheme: const TextTheme(
      headlineMedium: TextStyle(fontWeight: FontWeight.w700,fontSize: 35,letterSpacing: 2),

    )
    ),

    initialRoute: '/splash',
    getPages:[
      GetPage(name: '/splash', page: ()=>AnimationPage()),
      GetPage(name: '/create_account', page: ()=>CreateAccount()),
      GetPage(name: '/home', page:()=>Home() ),
      GetPage(name: '/login', page: ()=>Login(),middlewares: [HomeMiddleWare()]),
      GetPage(name: '/pinput_comp', page: ()=>PinputComp())
    ]
        
    );
}}
