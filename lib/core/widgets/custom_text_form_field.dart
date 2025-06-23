import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/colors_manager/colors_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.prefixIcon, required this.hint, this.suffixIcon, required this.controller, required this.validator, this.isObscure = false, this.onSuffixIconPressed});
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)?  validator;
  final bool isObscure ;
  final VoidCallback? onSuffixIconPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      validator: validator ,
      controller: controller,
      cursorColor: ColorsManager.white,
      style:  GoogleFonts.roboto(fontSize: 18.sp,fontWeight: FontWeight.normal,color: ColorsManager.white),
      decoration: InputDecoration(

        errorStyle: GoogleFonts.roboto(color: ColorsManager.red,fontSize: 14.sp,fontWeight: FontWeight.bold),
        hintText:hint ,
        hintStyle: GoogleFonts.roboto(fontSize: 18.sp,fontWeight: FontWeight.normal,color: ColorsManager.white),
        prefixIcon:Icon(prefixIcon,color: ColorsManager.white,size: 32.sp,),
        suffixIcon: IconButton(icon: Icon(suffixIcon,color: ColorsManager.white,size: 32.sp,),onPressed:onSuffixIconPressed ,),
        fillColor: ColorsManager.faintBlack,
        filled: true,
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r),borderSide: BorderSide(color: ColorsManager.faintBlack,width: 1.w)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r),borderSide: BorderSide(color: ColorsManager.faintBlack,width: 1.w)),
        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r),borderSide: BorderSide(color: ColorsManager.red,width: 1.w)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r),borderSide: BorderSide(color: ColorsManager.red,width: 1.w)),
      ),
    );
  }
}
