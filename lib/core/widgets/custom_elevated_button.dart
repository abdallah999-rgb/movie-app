import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/colors_manager/colors_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.text, required this.onPress});

  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style : ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        backgroundColor: ColorsManager.faintYellow,
        foregroundColor: ColorsManager.black,
        textStyle: GoogleFonts.roboto(fontSize: 20.sp,color: ColorsManager.black,fontWeight: FontWeight.normal),
        padding: REdgeInsets.all(16)
      ),
      onPressed: onPress,
      child: Text(text),);
  }
}
