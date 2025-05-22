import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_restaurant/core/static/global_serv.dart';
import 'package:flutter_application_restaurant/data/model/auth/login/forget_password/reset_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ResetServ {
  GlobalServ myServices = Get.put(GlobalServ());

  Future<bool> reset(
    final String password,
    final String password_confirmation,
    final bool logout_oth_dev,
  ) async {
    try {
      
      String? token = myServices.getToken();

      final response = await http.post(
        Uri.parse("http://127.0.0.1:8000/api/passwords/reset"),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
          if (token != null) 'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'password': password,
          'password_confirmation': password_confirmation,
          'logout_oth_dev': logout_oth_dev,
        }),
      );

      print('Status Code: ${response.statusCode}');
      print('Body: ${response.body}');

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        ResetModel model = ResetModel.fromJson(data);
        print('Success: ${model.message}');
        Get.snackbar(
          'Success',
          '${model.message}',
          backgroundGradient: LinearGradient(colors: [Colors.yellow , Colors.white]),
          snackPosition: SnackPosition.TOP,
          icon: Icon(Icons.face_retouching_natural_sharp,color: Colors.black,)
    );
        return true;
      } else {
        print('Error Message: ${data['message']}');
        Get.snackbar(
          'Failed',
          '${data['message']}',
          backgroundGradient: LinearGradient(colors: [Colors.red, Colors.white]),
          snackPosition: SnackPosition.BOTTOM,
    );
        return false;
      }
    } catch (e) {
      print('Exception: $e');
      return false;
    }
  }
}
