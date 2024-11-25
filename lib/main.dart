import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:order_delievery/view/pinputcomp.dart';
import 'package:order_delievery/view/create_account.dart';
import 'package:order_delievery/view/home.dart';
import 'package:order_delievery/view/login.dart';

void main() {
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
    ),
    home: CreateAccount(),
    getPages:[
      GetPage(name: '/create_account', page: ()=>CreateAccount()),
      GetPage(name: '/home', page:()=>Home() ),
      GetPage(name: '/login', page: ()=>Login()),
      GetPage(name: '/pinput_comp', page: ()=>PinputComp())
    ]
        
    );
}}
