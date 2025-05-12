import 'package:flutter/material.dart';

class Buttonlogin extends StatelessWidget {
  const Buttonlogin({super.key,   required this.text ,this.onPressed, this.color});
  final String text;
  final void Function()? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: Container(
        child: MaterialButton(
           padding: const EdgeInsets.symmetric(vertical: 10),
                onPressed: onPressed,                             
            color: color,
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text,
                  style: const TextStyle(
                  fontSize: 25,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                             
                              ),),
                                 Icon(Icons.run_circle_outlined,color: Colors.black)
              ],
            )
          ),
      ),
    );
  }
}