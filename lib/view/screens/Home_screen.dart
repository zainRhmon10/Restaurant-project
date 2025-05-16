import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant/controller/controller_home_page/Nav_Bar_controller.dart';
import 'package:resturant/view/widget/widget_home_screen/Nav_widget.dart';


final List screens = ListPages.pages; 
class HomeScreen extends StatelessWidget {
  final NavController controller = Get.put(NavController());
  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NavController>(builder: (controller) {
        return screens[controller.selectedIndex.value];  // عرض الشاشة المناسبة بناءً على selectedIndex
      }),
      floatingActionButton:
      GetBuilder<NavController>(builder: (controller){
         bool isSelected = controller.selectedIndex.value == 2;
    return Container(
      height: 80,
      width: 80,
      
      
      child: FloatingActionButton(
        backgroundColor: const Color(0xFFFFEB3B),
        shape: CircleBorder(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             Icon(
          Icons.home,
          size: 28,
          color: isSelected ? Colors.black : Colors.white,
        ),

        Text("Home",style: TextStyle(fontSize: 12,color: isSelected ? Colors.black:Colors.white),)
          ],
        ),
        onPressed: () => controller.changeIndex(2),
      ),
    );
        
      }
      
      ),
      
       
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomAppBar()
    );
  }
}
