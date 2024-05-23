import 'package:events_mvc/const/app_colore.dart';
import 'package:events_mvc/repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final LoginRepository controller = Get.put(LoginRepository());
AppBar mainAppBar() {
  return AppBar(
    backgroundColor: AppColor.light,
    shadowColor: AppColor.darkPink,
    foregroundColor: AppColor.darkPink,
    surfaceTintColor: AppColor.darkPink,
    actions: [
      IconButton(
        icon: const Icon(Icons.logout),
        onPressed: () {
          controller.logout();
        },
      ),
    ],
  );
}
