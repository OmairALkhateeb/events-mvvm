// ignore_for_file: avoid_print

import 'package:events_mvc/repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  final String title = "Login";
  final String registerButton = "Register";
  final String creatAcount = 'You don\'t have an account?';
  final String welcome = "Welcome!\nPlease log in to access your account.";

  final LoginRepository loginRepository;

  LoginViewModel({required this.loginRepository});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // login function ready for calling from login view
  login() async {
    final String email = emailController.text;
    final String password = passwordController.text;
    final context = Get.context;
    if (context != null) {
      await loginRepository.loginLogic(context, email, password);
    } else {
      print("Error: No context available");
    }
  }
}
