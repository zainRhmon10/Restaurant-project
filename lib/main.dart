// file: main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant/controller/controller_home_page/theme_controller.dart';
import 'package:resturant/view/screens/Home_screen.dart';
import 'package:resturant/view/screens/test_screen.dart';
import 'package:resturant/view/widget/widget_home_screen/theme.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // لتشغيل async في main
  final themeController = Get.put(ThemeController());
  await themeController.loadTheme(); // تحميل الثيم المحفوظ
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (controller) {
        return GetMaterialApp(
          title: 'GetX Theme App',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: controller.themeMode, // استخدام الثيم الحالي
          home: HomeScreen()
        );
      },
    );
  }
}
