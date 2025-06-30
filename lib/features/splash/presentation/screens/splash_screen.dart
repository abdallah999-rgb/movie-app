import 'package:flutter/material.dart';
import 'package:movie_app/core/assets_manager/assets_manager.dart';
import 'package:movie_app/core/colors_manager/colors_manager.dart';
import 'package:movie_app/core/routes_manager/routes_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigate();
  }
  void navigate()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
   bool isFirstTime =  prefs.getBool("first time")?? true;
   if(isFirstTime){
     await Future.delayed(Duration(seconds: 2));
     Navigator.pushReplacementNamed(context, RoutesManager.onBoarding);
   }else{
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, RoutesManager.signUp);
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(child: Image.asset(AssetsManager.splashImage)),

        ],
      ),
    );
  }
}
