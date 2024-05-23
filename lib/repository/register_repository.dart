// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:events_mvc/view/views/dash_board_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterRepository {
  Future<void> registerLogic(BuildContext context, String name, String password,
      String email, String number, String confPassword) async {
    try {
      // print("{'\n'$name'\n'$email'\n'$number'\n'$password'\n'$confPassword}");

      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/register'),
        body: {
          'name': name,
          'email': email,
          'password': password,
          'phone_number': number,
          'password_confirmation': confPassword,
        },
      );

      Map<String, dynamic> apiData = jsonDecode(response.body);

      // print('API Data: $apiData \n\n\n\n\n');
      if (response.statusCode == 200) {
        final String? token = apiData['token'];

        if (token != null) {
          await _saveToken(token);
          Get.to(() => DashBoard());
          print('New user has been added');
        } else {
          Get.snackbar('Error', 'No token received',
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        // print('object');
        final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
        String errorMessage = _parseError(responseBody);
        Get.snackbar('Error', errorMessage.trim(),
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to register user: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  String _parseError(Map<String, dynamic> responseBody) {
    String errorMessage = '';
    if (responseBody.containsKey('email')) {
      final emailErrors = responseBody['email'] as List<dynamic>;
      errorMessage +=
          'Email: ${emailErrors.isNotEmpty ? emailErrors[0] : ''}\n';
    }
    if (responseBody.containsKey('phone_number')) {
      final numberErrors = responseBody['phone_number'] as List<dynamic>;
      errorMessage +=
          'Phone Number: ${numberErrors.isNotEmpty ? numberErrors[0] : ''}\n';
    }
    if (responseBody.containsKey('password')) {
      final passwordErrors = responseBody['password'] as List<dynamic>;
      errorMessage +=
          'Password: ${passwordErrors.isNotEmpty ? passwordErrors[0] : ''}\n';
    }
    return errorMessage;
  }

  Future<void> _saveToken(String? token) async {
    if (token != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('Token', token);
      //print('Token saved: $token');
      print('Token has  been saved');
    }
  }
}
