import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:movie_app/core/assets_manager/assets_manager.dart';
import 'package:movie_app/core/colors_manager/colors_manager.dart';
import 'package:movie_app/core/routes_manager/routes_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  void loadData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("first time", false);
  }
  final GlobalKey<IntroductionScreenState> introKey = GlobalKey<IntroductionScreenState>();
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      hideBottomOnKeyboard: true,

      key: introKey,
      pages:buildPages(),
      onDone: () {
        // Navigate to Home or Login screen
      },
      showSkipButton: false,
      showNextButton: false,
      showDoneButton: false,
      showBottomPart: false,
      allowImplicitScrolling: false,
    );
  }
  List<PageViewModel> buildPages (){
    List <PageViewModel> pages = [
      PageViewModel(
        image: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsManager.onboarding1),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(0.5), Colors.black],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r),
                  ),
                ),
                height: 320.h,
                child: Padding(
                  padding: REdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 10.h),
                        Text(
                          textAlign: TextAlign.center,
                          "Find Your Next Favorite Movie Here",
                          style: GoogleFonts.inter(
                            color: ColorsManager.white,
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 16.h),

                        Text(
                          textAlign: TextAlign.center,
                          "Get access to a huge library of movies to suit all tastes. You will surely like it.",
                          style: GoogleFonts.inter(
                            color: ColorsManager.white.withOpacity(0.6),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              introKey.currentState?.next();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            textStyle: GoogleFonts.inter(
                              color: ColorsManager.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 20.sp,
                            ),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            backgroundColor: ColorsManager.faintYellow,
                            foregroundColor: ColorsManager.black,
                            padding: REdgeInsets.all(20),
                          ),
                          child: Text("Explore Now"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        title: "",
        body: "",

        decoration: PageDecoration(
          bodyAlignment: Alignment.bottomCenter,
          fullScreen: true,
        ),
      ),
      PageViewModel(
        image: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(AssetsManager.onboarding2),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF084250).withOpacity(0.5),
                    Color(0xFF084250),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r),
                  ),
                ),
                height: 270.h,
                child: Padding(
                  padding: REdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 10.h),
                        Text(
                          textAlign: TextAlign.center,
                          "Discover Movies",
                          style: GoogleFonts.inter(
                            color: ColorsManager.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 16.h),

                        Text(
                          textAlign: TextAlign.center,
                          "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
                          style: GoogleFonts.inter(
                            color: ColorsManager.white.withOpacity(0.6),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              introKey.currentState?.next();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            textStyle: GoogleFonts.inter(
                              color: ColorsManager.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 20.sp,
                            ),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            backgroundColor: ColorsManager.faintYellow,
                            foregroundColor: ColorsManager.black,
                            padding: REdgeInsets.all(20),
                          ),
                          child: Text("Next"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        title: "",
        body: "",

        decoration: PageDecoration(
          bodyAlignment: Alignment.bottomCenter,
          fullScreen: true,
        ),
      ),
      PageViewModel(
        image: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(AssetsManager.onboarding3),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF85210E).withOpacity(0.5),
                    Color(0xFF85210E),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r),
                  ),
                ),
                height: 330.h,
                child: Padding(
                  padding: REdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          "Explore All Genres",
                          style: GoogleFonts.inter(
                            color: ColorsManager.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 12.h),

                        Text(
                          textAlign: TextAlign.center,
                          "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
                          style: GoogleFonts.inter(
                            color: ColorsManager.white.withOpacity(0.6),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              introKey.currentState?.next();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            textStyle: GoogleFonts.inter(
                              color: ColorsManager.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 20.sp,
                            ),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            backgroundColor: ColorsManager.faintYellow,
                            foregroundColor: ColorsManager.black,
                            padding: REdgeInsets.all(20),
                          ),
                          child: Text("Next"),
                        ),
                        SizedBox(height: 16.h),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              introKey.currentState?.previous();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            textStyle: GoogleFonts.inter(
                              color: ColorsManager.faintYellow,
                              fontWeight: FontWeight.w800,
                              fontSize: 20.sp,
                            ),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(
                                color: ColorsManager.faintYellow,
                                width: 2.w,
                              ),
                            ),
                            backgroundColor: Colors.transparent,
                            foregroundColor: ColorsManager.faintYellow,
                            padding: REdgeInsets.all(20),
                          ),
                          child: Text("Back"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        title: "",
        body: "",

        decoration: PageDecoration(
          bodyAlignment: Alignment.bottomCenter,
          fullScreen: true,
        ),
      ),
      PageViewModel(
        image: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(AssetsManager.onboarding4),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF4C2471).withOpacity(0),
                    Color(0xFF4C2471),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r),
                  ),
                ),
                height: 360.h,
                child: Padding(
                  padding: REdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          "Create Watch lists",
                          style: GoogleFonts.inter(
                            color: ColorsManager.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 12.h),

                        Text(
                          textAlign: TextAlign.center,
                          "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
                          style: GoogleFonts.inter(
                            color: ColorsManager.white.withOpacity(0.6),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              introKey.currentState?.next();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            textStyle: GoogleFonts.inter(
                              color: ColorsManager.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 20.sp,
                            ),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            backgroundColor: ColorsManager.faintYellow,
                            foregroundColor: ColorsManager.black,
                            padding: REdgeInsets.all(20),
                          ),
                          child: Text("Next"),
                        ),
                        SizedBox(height: 16.h),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              introKey.currentState?.previous();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            textStyle: GoogleFonts.inter(
                              color: ColorsManager.faintYellow,
                              fontWeight: FontWeight.w800,
                              fontSize: 20.sp,
                            ),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(
                                color: ColorsManager.faintYellow,
                                width: 2.w,
                              ),
                            ),
                            backgroundColor: Colors.transparent,
                            foregroundColor: ColorsManager.faintYellow,
                            padding: REdgeInsets.all(20),
                          ),
                          child: Text("Back"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        title: "",
        body: "",

        decoration: PageDecoration(
          bodyAlignment: Alignment.bottomCenter,
          fullScreen: true,
        ),
      ),
      PageViewModel(
        image: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(AssetsManager.onboarding5),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF601321).withOpacity(0),
                    Color(0xFF601321),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r),
                  ),
                ),
                height: 340.h,
                child: Padding(
                  padding: REdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 8.h),
                        Text(
                          textAlign: TextAlign.center,
                          "Explore All Genres",
                          style: GoogleFonts.inter(
                            color: ColorsManager.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 12.h),

                        Text(
                          textAlign: TextAlign.center,
                          "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
                          style: GoogleFonts.inter(
                            color: ColorsManager.white.withOpacity(0.6),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              introKey.currentState?.next();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            textStyle: GoogleFonts.inter(
                              color: ColorsManager.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 20.sp,
                            ),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            backgroundColor: ColorsManager.faintYellow,
                            foregroundColor: ColorsManager.black,
                            padding: REdgeInsets.all(20),
                          ),
                          child: Text("Next"),
                        ),
                        SizedBox(height: 16.h),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              introKey.currentState?.previous();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            textStyle: GoogleFonts.inter(
                              color: ColorsManager.faintYellow,
                              fontWeight: FontWeight.w800,
                              fontSize: 20.sp,
                            ),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(
                                color: ColorsManager.faintYellow,
                                width: 2.w,
                              ),
                            ),
                            backgroundColor: Colors.transparent,
                            foregroundColor: ColorsManager.faintYellow,
                            padding: REdgeInsets.all(20),
                          ),
                          child: Text("Back"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        title: "",
        body: "",

        decoration: PageDecoration(
          bodyAlignment: Alignment.bottomCenter,
          fullScreen: true,
        ),
      ),
      PageViewModel(
        image: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(AssetsManager.onboarding6),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF2A2C30).withOpacity(0),
                    Color(0xFF2A2C30),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r),
                  ),
                ),
                height: 250.h,
                child: Padding(
                  padding: REdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 8.h),
                        Text(
                          textAlign: TextAlign.center,
                          "Start Watching Now",
                          style: GoogleFonts.inter(
                            color: ColorsManager.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(height: 24.h),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              RoutesManager.signUp,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            textStyle: GoogleFonts.inter(
                              color: ColorsManager.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 20.sp,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            backgroundColor: ColorsManager.faintYellow,
                            foregroundColor: ColorsManager.black,
                            padding: REdgeInsets.all(20),
                          ),
                          child: Text("Finish"),
                        ),
                        SizedBox(height: 16.h),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              introKey.currentState?.previous();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            textStyle: GoogleFonts.inter(
                              color: ColorsManager.faintYellow,
                              fontWeight: FontWeight.w800,
                              fontSize: 20.sp,
                            ),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(
                                color: ColorsManager.faintYellow,
                                width: 2.w,
                              ),
                            ),
                            backgroundColor: Colors.transparent,
                            foregroundColor: ColorsManager.faintYellow,
                            padding: REdgeInsets.all(20),
                          ),
                          child: Text("Back"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        title: "",
        body: "",

        decoration: PageDecoration(
          bodyAlignment: Alignment.bottomCenter,
          fullScreen: true,
        ),
      ),
    ];
    return pages;
  }
}
