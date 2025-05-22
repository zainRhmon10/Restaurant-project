import 'package:flutter/material.dart';
import 'package:flutter_application_restaurant/view/widget/slider/slider.dart';
import 'package:flutter_application_restaurant/view/screen/auth/forget_password/reset_password.dart';
import 'package:flutter_application_restaurant/view/screen/auth/register.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
 SharedPreferences? sharedPreferences;
Future<void> main() async {
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Register ()
  
    );
  }
}