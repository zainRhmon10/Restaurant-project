import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:resturant/controller/controller_home_page/Nav_Bar_controller.dart';
import 'package:resturant/view/screens/Home_screen.dart';
import 'package:resturant/view/screens/favorite_screen.dart';
import 'package:resturant/view/screens/main_store_screen.dart';
import 'package:resturant/view/screens/offers_screen.dart';
import 'package:resturant/view/screens/orders_screen.dart';
import 'package:resturant/view/screens/profile_screen.dart';

class ListPages {
  static final List<Widget> pages = [
    const OffersScreen(),
    const FavoriteScreen(),
    const  MainStoreScreen(),
    const OrdersScreen(),
    const ProfileScreen()
  ];
  
}



Widget buildIcon(IconData icon, int index, String label) {
  return GetBuilder<NavController>(builder: (controller) {
    final selected = controller.selectedIndex.value == index;
    return GestureDetector(
      onTap: () => controller.changeIndex(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        child: Column(
           mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: selected ? 29 : 22, color: selected ? Colors.yellow : Colors.grey),
            Text(label,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 8,  color: selected ? Colors.yellow:Colors.grey ),
            
            )

          ],
        )
      ),
    );
  });
}

Widget bottomAppBar(){
  return 
   
     Container(
      
       child: BottomAppBar(
        
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.white,
        child: Container(
        
           
         
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [buildIcon(Icons.local_offer_sharp, 0,"Offers"), buildIcon(Icons.favorite_outline, 1,"Favorites")]),
              Row(children: [buildIcon(Icons.receipt_long, 3,"Orders"), buildIcon(Icons.person, 4,"Profile")]),
            ],
          ),
        ),
          ),
     );
}












