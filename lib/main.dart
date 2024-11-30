import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:task_one/View/delivary_page.dart';
import 'package:task_one/constans.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: Constans.fontFamily,
      scaffoldBackgroundColor: Constans.screen),
      debugShowCheckedModeBanner: false,
      home: const DelivaryPage(),
    );
  }
}
