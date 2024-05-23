// ignore_for_file: avoid_print, must_be_immutable
import 'package:events_mvc/const/app_colore.dart';
import 'package:events_mvc/view/components/app_bar.dart';
import 'package:events_mvc/view/components/carousel_slider.dart';
import 'package:events_mvc/view/components/categories.dart';
import 'package:events_mvc/view_model/home_page_view_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  HomePageViewModel viewModel = HomePageViewModel();
  @override
  Widget build(BuildContext context) {
    print('HomePage built');
    return Scaffold(
      backgroundColor: AppColor.light,
      appBar: mainAppBar(),
      drawer: const Drawer(),
      body: _buildHomePageBodyContent(),
    );
  }

  Widget _buildHomePageBodyContent() {
    return SingleChildScrollView(
      child: Column(children: [
        // widget for welcome message
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'HI ',
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Dear ,',
                    style: TextStyle(
                      color: AppColor.darkPink,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    viewModel.message,
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
        ),
        const CarouselAds(),
        // categories text widget
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  viewModel.selectType,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Oswald",
                    color: AppColor.black,
                    fontSize: 19,
                  ),
                ),
              ),
            ],
          ),
        ),
        // categories listview
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: viewModel.categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: Categories(
                        category: viewModel.categories[index],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 500),
      ]),
    );
  }
}
