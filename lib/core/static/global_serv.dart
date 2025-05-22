import 'package:flutter_application_restaurant/main.dart';

class GlobalServ {
  Future<void> saveToken(String token) async {
    await sharedPreferences?.setString('token', token);
    print("object");
  }
  String? getToken() {
    return sharedPreferences!.getString('token');
  }
   Future<bool> removeToken() async {
    return await sharedPreferences!.remove('token');
  }

   Future<void> saveTheme(bool isDarkMode) async {
    await sharedPreferences?.setBool('isDarkMode', isDarkMode);
  }

  bool getSavedTheme() {
    return sharedPreferences?.getBool('isDarkMode') ?? false;
  }

 

}
