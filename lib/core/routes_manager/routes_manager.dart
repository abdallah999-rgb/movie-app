import 'package:flutter/cupertino.dart';
import 'package:movie_app/features/auth/presentation/screens/reset_password/reset_password.dart';
import 'package:movie_app/features/auth/presentation/screens/sign_in_screen/sign_in_screen.dart';
import 'package:movie_app/features/auth/presentation/screens/sign_up_screen/sign_up.dart';
import 'package:movie_app/features/home/presentation/screens/home_page.dart';
import 'package:movie_app/features/onboarding/presentation/screens/onboarding_screens.dart';
import 'package:movie_app/features/splash/presentation/screens/splash_screen.dart';

class RoutesManager {
  static const String splash = "/splash";
  static const String signIn = "/sign in";
  static const String onBoarding = "/on boarding";
  static const String signUp = "/sign up";
  static const String home = "/home";
  static const String resetPassword = "/reset";

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return CupertinoPageRoute(builder: (context) => SplashScreen());
      case signIn:
        return CupertinoPageRoute(builder: (context) => SignInScreen());
      case onBoarding:
        return CupertinoPageRoute(builder: (context) => OnboardingScreens());
      case signUp:
        return CupertinoPageRoute(builder: (context) => SignUpScreen());
      case home:
        return CupertinoPageRoute(builder: (context) => HomePage());
      case resetPassword:
        return CupertinoPageRoute(builder: (context) => ResetPassword());
    }
    return null;
  }
}
