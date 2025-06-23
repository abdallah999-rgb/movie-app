import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/assets_manager/assets_manager.dart';
import 'package:movie_app/core/colors_manager/colors_manager.dart';

class LanguageWidget extends StatefulWidget {
  @override
  State<LanguageWidget> createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageWidget> {
  String selectedLang = 'en';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedToggleSwitch<String>.rolling(
          padding: REdgeInsets.all(1),
          current: selectedLang,
          values: ['ar', 'en'],
          height: 50.h,
          onChanged: (lang) {
            setState(() => selectedLang = lang);
          },
          iconList: [
            Image.asset(AssetsManager.america,fit: BoxFit.cover,),
            Image.asset(AssetsManager.egypt,)

          ],

          style: ToggleStyle(


            backgroundColor: ColorsManager.black,
            borderColor: ColorsManager.faintYellow,
            indicatorColor: ColorsManager.black,
            borderRadius: BorderRadius.circular(30.r),
            indicatorBorder: Border.all(color: ColorsManager.faintYellow, width: 2,),
          ),
        ),
      ],
    );
  }
}
