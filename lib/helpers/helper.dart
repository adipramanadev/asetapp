import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config/app_constant.dart';

class DatabaseHelper {
  // Login function
  Future<bool> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('${BaseUrl.baseUrl}/user/login.php'),
        headers: {'Accept': 'application/json'},
        body: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        bool loginSuccess = data['status'] == 'success';

        return loginSuccess;
      } else {
        print('Server error: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // Handle any exceptions
      print('Error: $e');
      return false;
    }
  }
}
