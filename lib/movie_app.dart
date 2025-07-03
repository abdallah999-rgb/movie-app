import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/configuration/theme_manager/theme_manager.dart';
import 'package:movie_app/core/routes_manager/routes_manager.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return ScreenUtilInit(
      designSize: Size(430, 932),
      splitScreenMode: true,
      minTextAdapt: true,

      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RoutesManager.router,
            initialRoute: RoutesManager.signIn,
            darkTheme: ThemeManager.dark,
            themeMode: ThemeMode.dark,
          ),
    );
  }
}
