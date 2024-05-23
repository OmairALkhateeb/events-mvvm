import 'package:events_mvc/view/views/archive_page_view.dart';
import 'package:events_mvc/view/views/favorite_page_view.dart';
import 'package:events_mvc/view/views/home_page_view.dart';
import 'package:events_mvc/view_model/dash_board_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:events_mvc/const/app_colore.dart';

class DashBoard extends StatelessWidget {
  final RxInt selectedIndex = 0.obs;
  final DashBoardViewModel viewModel = Get.put(DashBoardViewModel());

  DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOption = [
      HomePage(),
      const FavoritePage(),
      ArchivePage()
    ];

    return Scaffold(
      body: Center(
        child: Obx(() => widgetOption[selectedIndex.value]),
      ),
      bottomNavigationBar: Container(
        color: AppColor.light,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                color: AppColor.morePink),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: GNav(
                gap: 0,
                padding: const EdgeInsets.all(16),
                backgroundColor: AppColor.morePink,
                color: AppColor.white,
                activeColor: AppColor.morePink,
                tabBackgroundColor: AppColor.white,
                tabs: [
                  GButton(
                    icon: Icons.home,
                    iconSize: 24,
                    text: viewModel.iconOneTitle,
                  ),
                  GButton(
                    icon: Icons.favorite_border,
                    iconSize: 24,
                    text: viewModel.iconTowTitle,
                  ),
                  GButton(
                    icon: Icons.archive_rounded,
                    iconSize: 24,
                    text: viewModel.iconThreeTitle,
                  ),
                ],
                selectedIndex: selectedIndex.value,
                onTabChange: (index) {
                  selectedIndex.value = index;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
