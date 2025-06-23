import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/colors_manager/colors_manager.dart';

class ThemeManager{
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      foregroundColor: ColorsManager.yellow,
      titleTextStyle: GoogleFonts.roboto(color: ColorsManager.yellow,fontWeight: FontWeight.w500,fontSize: 18.sp),
      backgroundColor: ColorsManager.black,
      iconTheme: IconThemeData(
        color: ColorsManager.yellow
      ),

    ),
    iconTheme: IconThemeData(
      color: ColorsManager.white
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(fontSize:36,fontWeight: FontWeight.w500,color: ColorsManager.white ),

      bodyMedium: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.normal,color: ColorsManager.white.withOpacity(0.4))
    )
  );
}