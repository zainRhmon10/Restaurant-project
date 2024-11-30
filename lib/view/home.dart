import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(backgroundColor: Colors.yellow[200],),
      body: Container(padding: EdgeInsets.all(20),child: Column(
        children: [
          Text('data',style: TextStyle(fontSize: 35),),
          MaterialButton(child: Text('signout'),onPressed: (){

            userData!.remove('email');
            userData!.remove('phone');
            Get.toNamed('/login');

          })
        ],
      ),),
    );
  }
}
