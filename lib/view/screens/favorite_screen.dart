import 'package:flutter/material.dart';
import 'package:resturant/view/widget/widget_favourit_screen/card_favourite.dart';
import 'package:resturant/view/widget/widget_favourit_screen/info_card.dart';
import 'package:resturant/view/widget/widget_favourit_screen/search_favourite.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: search_favourute(),
      
        body: Container(
      child: ListView(
        children: [
         
             cardFavourite(15,3,"assets/images/images (2).jpg", "Shrimp Pizza","A seafood lover’s dream"),
             info_Card_Favourite(1, "20-50", 8.7),

             
             cardFavourite(2,3,"assets/images/arabsstock_P139211.jpg", "Fresh Pear Juice","Sweet and refreshing juice made from ripe pears."),
             info_Card_Favourite(2, "20-40", 7.5),


             cardFavourite(2,3,"assets/images/صورة-مميزة-لساندوتش-برجر-شهي-جدا.jpg", "Delicious Burger","Juicy beef with melted cheese"),
             info_Card_Favourite(3, "20-40", 9.2),
             SizedBox(height: 30,)

        ],
      ),
    ));
  }
}

//  Container(
//             margin: EdgeInsets.only(right: 20, left: 20, top: 20),
//             padding: EdgeInsets.all(10),
//             height: 40,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: Colors.grey)),
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.search,
//                   size: 20,
//                   color: Colors.grey,
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   "Serach your Favourite Food..",
//                   style: TextStyle(color: Colors.grey),
//                 )
//               ],
//             ),
//           ),
