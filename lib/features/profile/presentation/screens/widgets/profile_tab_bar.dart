import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/colors_manager/colors_manager.dart';

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: TabBar(tabs: [
        Tab( child: Column(
          children: [
            Icon(Icons.list),
            Text("Watch List ",style: GoogleFonts.roboto(color: ColorsManager.white,fontSize: 20.sp,fontWeight: FontWeight.normal),)
          ],
        ),),
        Tab( child: Column(
          children: [
            Icon(Icons.list),
            Text("Watch List ",style: GoogleFonts.roboto(color: ColorsManager.white,fontSize: 20.sp,fontWeight: FontWeight.normal),)
          ],
        ),)
      ]),
    );
  }
}
