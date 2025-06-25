import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key,required this.avatars, required this.onPageChanged});
 final List<Image> avatars;
 final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
      options: CarouselOptions(
        onPageChanged: onPageChanged,
        height: 130.h,
        aspectRatio: 16/9,
        viewportFraction: 0.35,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.33,
        scrollDirection: Axis.horizontal,


      ),
      items:
      avatars.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: 150.w,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: i,

            );
          },
        );
      }).toList(),
    );
  }
}
