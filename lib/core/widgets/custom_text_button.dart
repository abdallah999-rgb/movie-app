import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/colors_manager/colors_manager.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text, required this.onPress});
  final String text;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPress, child: Text(text,style: GoogleFonts.roboto(fontWeight: FontWeight.normal,fontSize: 16.sp,color: ColorsManager.faintYellow),));
  }
}
