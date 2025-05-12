import 'package:flutter/material.dart';
import 'package:flutter_application_restaurant/controller/onboardingController.dart';
import 'package:get/get.dart';

class Button extends GetView<OnboardingcontrollerImp> {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      child: MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 10),
        onPressed: (){
          controller.next();
              },                                    
        color: const Color(0xFFFFFEE58),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child:const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Next  ',
              style: TextStyle(
              fontSize: 25,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold
                               ),),
              Icon(Icons.run_circle_outlined,color: Colors.black)
                ],
              )
               
                                                  ),
            );
  }
}
 