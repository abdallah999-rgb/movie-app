import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

BottomNavigationBarItem buildCustomNavItem({
  required String iconPath,
  required String label,
  required int index,
  required int currentIndex,
  required Color selectedColor,
  required Color unselectedColor,
  double width = 26,
  double height = 23,
}) {
  return BottomNavigationBarItem(
    icon: SvgPicture.asset(
      iconPath,
      width: width.w,
      height: height.h,
      colorFilter: ColorFilter.mode(
        currentIndex == index ? selectedColor : unselectedColor,
        BlendMode.srcIn,
      ),
    ),
    label: label,
  );
}
