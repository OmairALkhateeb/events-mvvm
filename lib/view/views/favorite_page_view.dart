import 'package:events_mvc/const/app_colore.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkPink,
      body: const Center(
        child: Text('In progress....',
            style: TextStyle(color: Colors.white, fontSize: 35)),
      ),
    );
  }
}
