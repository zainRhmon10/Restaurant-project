import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resturant/view/widget/widget_home_screen/appBar_screens.dart';

class MainStoreScreen extends StatelessWidget {
  const MainStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(
        children: [
          appBar()
         

        ],
      )
    );
  }
}