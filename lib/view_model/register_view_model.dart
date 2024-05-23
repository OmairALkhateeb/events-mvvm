// ignore_for_file: avoid_print

import 'package:events_mvc/repository/register_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterViewModel extends GetxController {
  final String title = "Register";
  final String welcome =
      'Welcome to our app! \nPlease fill out the following form to register';

  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conPasswordController = TextEditingController();

  final RegisterRepository registerRepository;

  RegisterViewModel({required this.registerRepository});

  // register function ready for calling from login view

  register() async {
    final String name = nameController.text;
    final String number = numberController.text;
    final String password = passwordController.text;
    final String confPassword = conPasswordController.text;
    final String email = emailController.text;

    if (password != confPassword) {
      Get.snackbar('Error', 'Passwords do not match',
          snackPosition: SnackPosition.BOTTOM);
      print('Passwords do not match');
      return;
    }

    final context = Get.context;
    if (context != null) {
      await registerRepository.registerLogic(
          context, name, password, email, number, confPassword);
    } else {
      print("Error: No context available");
    }
  }
}
