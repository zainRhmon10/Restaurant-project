import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Container(padding: EdgeInsets.all(20),child: Text('Home Page',style: TextStyle(fontSize: 35),),),
    );
  }
}
