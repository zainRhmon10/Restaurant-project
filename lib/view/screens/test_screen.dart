// file: home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant/controller/controller_home_page/theme_controller.dart';

class TestScreen extends StatelessWidget {
  final ThemeController themeController = Get.find(); // جلب الكنترولر

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الثيم مع GetBuilder"),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () => themeController.toggleTheme(),
          ),
        ],
      ),
      body: Center(
        child: GetBuilder<ThemeController>(
          builder: (_) => ElevatedButton(
            onPressed: () => themeController.toggleTheme(),
            child: Text("تبديل الثيم"),
          ),
        ),
      ),
    );
  }
}
