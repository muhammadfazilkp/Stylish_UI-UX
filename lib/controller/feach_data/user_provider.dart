import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/model/registeration_model.dart';

class UserProvider extends ChangeNotifier {
  List<User>?user;
  //regester user has created
  TextEditingController userNameContoroller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailsController = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  Future<void> registerUser({
    required String userFirstname,
    required String userLastname,
    required String userEmail,
    required String userPhone,
    required String userPassword,
    required String userCity,
    required String userZipcode,
  }) async {
    const apiUrl =
        'https://snapkaro.com/eazyrooms_staging/api/user_registeration';

         final SharedPreferences preferences = await SharedPreferences.getInstance();


    final Map<String, String> requestBody = {
      'user_firstname': userFirstname,
      'user_lastname': userLastname,
      'user_email': userEmail,
      'user_phone': userPhone,
      'user_password': userPassword,
      'user_city': userCity,
      'user_zipcode': userZipcode,
    };

    try {
      final response = await http.post(Uri.parse(apiUrl), body: requestBody);

      if (response.statusCode == 200) {
        preferences.setBool('registerStatus', true);
        print('User registration successful');
      } else {
        preferences.setBool('registerStatus', false);
        throw Exception('Failed to register user');
        
      }
    } catch (error) {
      preferences.setBool('registerStatus', false);
      print('Error during user registration: $error');
      throw Exception('Failed to register user');
    }
  }

  //text EditingController
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

 Future<User?> loginUser(String email, String password) async {
 final SharedPreferences preferences = await SharedPreferences.getInstance();
  final Map<String, dynamic> body = {
    'user_email': email,
    'user_password': password,
  };

  final bodyJson = jsonEncode(body);

  try {
    final response = await http.post(
      Uri.parse("https://snapkaro.com/eazyrooms_staging/api/userlogin"),
      headers: {
        "Content-Type": "application/json",
      },
      body: bodyJson,
    );

    print('Login response: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      preferences.setBool('LoginStatus', true);
      final Map<String, dynamic>? jsonResponse = json.decode(response.body);


      if (jsonResponse != null &&
          jsonResponse.containsKey('status') &&
          jsonResponse.containsKey('data')) {
        if (jsonResponse['status'] == 'success') {
          final Map<String, dynamic> userData = jsonResponse['data'];
          // Assuming User.fromJson is a valid method in your User model
          final User user = User.fromJson(userData);
          return user;
        } else {
          print('Login failed: ${jsonResponse['message']}');
          return null;
        }
      } else {
        print('Invalid or null jsonResponse');
        return null;
      }
    } else {
      preferences.setBool('LoginStatus', false);

      print('Login failed with status code: ${response.statusCode}');
      return null;
    }
  } catch (error) {
      preferences.setBool('LoginStatus', false);

    print('Error during login: $error');
    return null;
  }
}


 Future<void> fetchUsers() async {
    try {
      final response = await http.get(
        Uri.parse('https://snapkaro.com/eazyrooms_staging/api/user_registeration'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);

        user = jsonList.map((jsonMap) => User.fromJson(jsonMap)).toList();
        notifyListeners();
        print(user);
      } else {
        // Handle the error case
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching users: $error');
    }
  }




}
