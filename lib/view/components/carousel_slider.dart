import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselAds extends StatefulWidget {
  const CarouselAds({super.key});

  @override
  _CarouselAdsState createState() => _CarouselAdsState();
}

class _CarouselAdsState extends State<CarouselAds> {
  // ignore: unused_field
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print('CarouselAds built');
    final List<Image> myImage = [
      Image.asset('ads1.png'),
      Image.asset('ads1.png'),
      Image.asset('ads1.png'),
    ];

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10, left: 20),
          child: Row(
            children: [
              Text(
                'Offers For You:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Oswald",
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              height: 175,
              viewportFraction: 1,
              autoPlayAnimationDuration: const Duration(microseconds: 800),
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: myImage,
          ),
        ),
      ],
    );
  }
}