import 'package:flutter/material.dart';
import 'package:flutter_application_restaurant/controller/auth/register_controller.dart';
import 'package:flutter_application_restaurant/core/functions/validation.dart';
import 'package:flutter_application_restaurant/data/services/auth/register/register_serv.dart';
import 'package:flutter_application_restaurant/view/widget/auth/login/button_login.dart';
import 'package:flutter_application_restaurant/view/widget/auth/register/confirm_email.dart';
import 'package:flutter_application_restaurant/view/widget/auth/login/textform_login.dart';
import 'package:flutter_application_restaurant/view/widget/auth/register/staticbody_register.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget { 
   Register({super.key});
  RegisterControllerImp cont=Get.put(RegisterControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
         children: [
        Staticbidyregister(),
         Form(
            autovalidateMode: AutovalidateMode.disabled,
            key: cont.formstate,
            child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Textformlogin(text: 'First Name',iconData: Icons.person ,mycontoller: cont.first_name,isNumber: false,
                validator: (val) {
                  return validInput(val!, 3, 20, "username");
                        },
                        ),                
              const SizedBox(height: 40),
              Textformlogin(text: 'Last Name',iconData: Icons.person ,mycontoller: cont.last_name,isNumber: false,
                validator: (val) {
                  return validInput(val!, 3, 20, "username");
                        },
                        ), 
              const SizedBox(height: 40), 
              Textformlogin(text: 'Phone Number',iconData: Icons.phone_android_outlined,mycontoller: cont.mobile,isNumber: true,  
                validator: (val) {
                   return validInput(val!, 7, 11, "phone");
                        },
                        ),
              const SizedBox(height: 40), 
              Textformlogin(
                validator:  (val) {
                  return validInput(val!, 5, 100, "email");
                          },
                isNumber: false,
                mycontoller: cont.email,
                text: "Email",
                iconData: Icons.email,
                                  ),
              const SizedBox(height: 40),
             GetBuilder<RegisterControllerImp>(
               builder: (controller) => Textformlogin( 
                text: 'Password',
                iconData:cont.isshowpassword ? Icons.visibility_off : Icons.visibility,
                mycontoller: cont.password,
                isNumber: false,
                validator:  (val) {
                  return validInput(val!, 5, 30, "password");
                            },
                 obscureText: cont.isshowpassword,
                onTapIcon: () {
                cont.showPassword();
                           },     
                        ),),
              const SizedBox(height: 40),
             GetBuilder<RegisterControllerImp>(
              builder: (controller) => Textformlogin(
                text: 'Confirm Password',
                iconData: cont.isshowpassword1 ? Icons.visibility_off : Icons.visibility,
                mycontoller: cont.password_confirmation,
                isNumber: false,
              validator:  (val) {
              return validInput(val!, 5, 30, "password");
                            },
               obscureText: cont.isshowpassword1,
                onTapIcon: () {
                cont.showPassword1();
                           }, 
                          ),),
             const SizedBox(height: 40),
              Buttonlogin(
                text: "Let's go",
                 color:  Color(0xFFFFFEE58),
                onPressed: () async{
                if(cont.formstate.currentState!.validate()){
             bool success=   await RegisterServ.register(
                cont.first_name.text,
                cont.last_name.text,
                cont.mobile.text,
                cont.email.text,
                cont. password.text,
                cont.password_confirmation.text);
                print(cont.email);
                if(success){
                Get.to(Confirm_email());}}
},
                                ),
                         ]  ),
                     ),
        
                     ]),
      ),
    );
                  
            
    
    
    
    
      
  }




  
  

}

  









// // دالة لعرض رسالة نجاح عامة
// // تم إزالة BuildContext من الدالة نفسها لكنها لا تزال تمرر لـ showDialog
// void _showSuccessAlertDialog(BuildContext context, String message) { // BuildContext لا يزال مطلوباً لـ showDialog
//   showDialog(
//     context: context, // السياق مطلوب هنا
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       // **استخدام نص ثابت بدلاً من S.of(context)**
//       return AlertDialog(
//         title: const Text('نجح التسجيل'), // عنوان ثابت
//         content: Text(message),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('موافق'), // نص ثابت
//             onPressed: () {
//               Navigator.of(context).pop();
//               // ... انتقال للشاشة التالية ...
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

// // **الدالة الجديدة والمعدلة لأخطاء التحقق (Validation Errors)** - تم إزالة S.of(context)
// void _showValidationErrorsAlertDialog(BuildContext context, String generalMessage, Map<String, dynamic> errors) { // BuildContext لا يزال مطلوباً لـ showDialog
//    String errorDetails = '';
//    if (errors.isNotEmpty) {
//      errors.forEach((field, messages) {
//        // تنسيق أسماء الحقول (هذا التنسيق لا يعتمد على التوطين)
//        String readableField = field.split('_').map((word) => '${word[0].toUpperCase()}${word.substring(1)}').join(' ');
//        // إضافة تفاصيل الأخطاء لكل حقل على شكل قائمة
//        errorDetails += '$readableField:\n - ${(messages as List).join('\n - ')}\n';
//      });
//    } else {
//      // إذا لم تكن هناك تفاصيل أخطاء محددة للحقول، استخدم الرسالة العامة
//      errorDetails = generalMessage;
//    }

//   showDialog(
//     context: context, // السياق مطلوب هنا
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         // **استخدام نصوص ثابتة بدلاً من S.of(context)**
//         title: const Text('فشل التحقق'), // عنوان ثابت
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: <Widget>[
//               Text(generalMessage),
//               if (errors.isNotEmpty) const SizedBox(height: 10),
//               if (errors.isNotEmpty)
//                 const Text('التفاصيل:', style: TextStyle(fontWeight: FontWeight.bold)), // نص ثابت
//               if (errors.isNotEmpty)
//                 Text(errorDetails), // نص التفاصيل من الـ JSON بعد التنسيق
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('موافق'), // نص ثابت
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//   );
//   }
//     );
  
// }

// // **الدالة العامة للأخطاء (معدلة لتأخذ عنوانًا ورسالة وبدون S.of(context))**
// void _showErrorAlertDialog(BuildContext context, String title, String message) { // BuildContext لا يزال مطلوباً لـ showDialog
//   showDialog(
//     context: context, // السياق مطلوب هنا
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text(title), // العنوان قادم كـ parameter
//         content: Text(message), // الرسالة قادمة كـ parameter
//         actions: <Widget>[
//           TextButton(
//             child: const Text('موافق'), // نص ثابت
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
      
//     );
//  } );
// }
