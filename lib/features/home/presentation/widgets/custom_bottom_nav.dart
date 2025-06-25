import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/assets_manager/assets_manager.dart';
import 'package:movie_app/core/colors_manager/colors_manager.dart';
import 'package:movie_app/features/home/presentation/widgets/custom_nav_item.dart';

class CustomBottomNav extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;
  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.faintBlack,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: BottomNavigationBar(
          onTap: widget.onTap,
          currentIndex: widget.currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            buildCustomNavItem(
              currentIndex: widget.currentIndex,
              index: 0,
              iconPath: AssetsMangerIcons.home,
              label: "Home",
              selectedColor: ColorsManager.faintYellow,
              unselectedColor: Colors.white,
            ),
            buildCustomNavItem(
              currentIndex: widget.currentIndex,
              index: 1,
              iconPath: AssetsMangerIcons.search,
              label: "Search",
              selectedColor: ColorsManager.faintYellow,
              unselectedColor: Colors.white,
            ),
            buildCustomNavItem(
              currentIndex: widget.currentIndex,
              index: 2,
              iconPath: AssetsMangerIcons.browse,
              label: "Browse",
              selectedColor: ColorsManager.faintYellow,
              unselectedColor: Colors.white,
            ),
            buildCustomNavItem(
              currentIndex: widget.currentIndex,
              index: 3,
              iconPath: AssetsMangerIcons.profile,
              label: "Profile",
              selectedColor: ColorsManager.faintYellow,
              unselectedColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
