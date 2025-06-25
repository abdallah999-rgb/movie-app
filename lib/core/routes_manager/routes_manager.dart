import 'package:flutter/cupertino.dart';
import 'package:movie_app/features/auth/presentation/screens/reset_password/reset_password.dart';
import 'package:movie_app/features/auth/presentation/screens/sign_in_screen/sign_in_screen.dart';
import 'package:movie_app/features/auth/presentation/screens/sign_up_screen/sign_up.dart';
import 'package:movie_app/features/browse/presentation/screens/browse_screen.dart';
import 'package:movie_app/features/home/presentation/screens/home.dart';
import 'package:movie_app/features/home/presentation/screens/home_screen.dart';
import 'package:movie_app/features/onboarding/presentation/screens/onboarding_screens.dart';
import 'package:movie_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:movie_app/features/search/presentation/screens/search_screen.dart';
import 'package:movie_app/features/splash/presentation/screens/splash_screen.dart';

class RoutesManager {
  static const String splash = "/splash";
  static const String signIn = "/sign in";
  static const String onBoarding = "/on boarding";
  static const String signUp = "/sign up";
  static const String home = "/home";
  static const String homeScreen = "/home screen";
  static const String searchScreen = "/search screen";
  static const String browseScreen = "/browse screen";
  static const String profileScreen = "/profile screen";
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
        return CupertinoPageRoute(builder: (context) => Home());
      case resetPassword:
        return CupertinoPageRoute(builder: (context) => ResetPassword());
      case homeScreen:
        return CupertinoPageRoute(builder: (context) => HomeScreen());
      case searchScreen:
        return CupertinoPageRoute(builder: (context) => SearchScreen());
      case browseScreen:
        return CupertinoPageRoute(builder: (context) => BrowseScreen());
      case profileScreen:
        return CupertinoPageRoute(builder: (context) => ProfileScreen());
    }
    return null;
  }
}
