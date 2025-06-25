import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/assets_manager/assets_manager.dart';
import 'package:movie_app/core/colors_manager/colors_manager.dart';
import 'package:movie_app/features/home/presentation/widgets/movie_carousel_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;

  final List<Map<String, String>> movies = [
    {
      "image":
          "https://image.tmdb.org/t/p/w500/zfE0R94v1E8cuKAerbskfD3VfUt.jpg", // 1917
      "rating": "7.7",
    },
    {
      "image":
          "https://img.yts.mx/assets/images/movies/90_feet_from_home_2019/large-cover.jpg", // Captain America
      "rating": "5.6",
    },
    {
      "image":
          "https://img.yts.mx/assets/images/movies/the_last_rodeo_2025/large-cover.jpg", // Captain America
      "rating": "6.9",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final String backgroundImage = movies[_currentIndex]['image']!;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.network(backgroundImage, fit: BoxFit.cover),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black54, Colors.black87, Colors.black],
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetsManager.availableNow,
                      width: 200.w,
                      height: 93.h,
                    ),
                    SizedBox(height: 16.h),
                    CarouselSlider.builder(
                      carouselController: _carouselController,
                      itemCount: movies.length,
                      options: CarouselOptions(
                        height: 300.h,
                        enlargeCenterPage: true,
                        viewportFraction: 0.55,
                        autoPlay: false,
                        onPageChanged: (index, reason) {
                          setState(() => _currentIndex = index);
                        },
                      ),
                      itemBuilder: (context, index, realIdx) {
                        return MovieCaroulselCard(
                          imageUrl: movies[index]['image']!,
                          rating: movies[index]['rating']!,
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                    Image.asset(
                      AssetsManager.watchNow,
                      width: 300.w,
                      height: 150.h,
                    ),
                    SizedBox(height: 16.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Action",
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: ColorsManager.white,
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "See more ",
                                  style: TextStyle(
                                    color: ColorsManager.faintYellow,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                WidgetSpan(
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: ColorsManager.faintYellow,
                                    size: 17.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(
                      height: 240.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: MovieCaroulselCard(
                              imageUrl: movies[index]['image']!,
                              rating: movies[index]['rating']!,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
