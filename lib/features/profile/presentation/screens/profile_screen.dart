import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/assets_manager/assets_manager.dart';
import 'package:movie_app/core/colors_manager/colors_manager.dart';
import 'package:movie_app/core/dependency_injection/dio.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/features/profile/presentation/provider/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Image> avatars=[
    Image.asset(AssetsManager.gamer1,fit: BoxFit.fill,),
    Image.asset(AssetsManager.gamer2,fit: BoxFit.fill,),
    Image.asset(AssetsManager.gamer4,fit: BoxFit.fill,),
    Image.asset(AssetsManager.gamer5,fit: BoxFit.fill,),
    Image.asset(AssetsManager.gamer6,fit: BoxFit.fill,),
    Image.asset(AssetsManager.gamer7,fit: BoxFit.fill,),
    Image.asset(AssetsManager.gamer8,fit: BoxFit.fill,),
    Image.asset(AssetsManager.gamer9,fit: BoxFit.fill,),

  ];
  late ProfileViewModel profileViewModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    profileViewModel =  getIt<ProfileViewModel>();
    getUser();


  }

  void loadData() {
    profileViewModel =  getIt<ProfileViewModel>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => profileViewModel,

       child:  Consumer<ProfileViewModel>(
         builder: (context, value, child) {

           var state = value.profileDataState;
           switch(state){

             case SuccessProfileDataState():
              return Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
           Container(
           width: double.infinity,
           color: ColorsManager.faintBlack,
           child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
           Padding(
           padding:  REdgeInsets.all(12.0),
           child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,

           children: [
           Row(
           children: [
           SizedBox(width: 16.w),
           Expanded(
           child: Column(
           children: [
           SizedBox(height: 50.h),
                     avatars.elementAt(state.user.avaterId!),
           SizedBox(height: 8.h),
           Text(
           state.user.name?? "",
           style: GoogleFonts.roboto(
           color: ColorsManager.white,
           fontSize: 20.sp,
           fontWeight: FontWeight.bold,
           ),
           textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,

           ),


           ],
           ),
           ),
           SizedBox(width: 50.w),
           Expanded(
           flex: 2,
           child: Row(
             children: [
               Column(
               children: [
               Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,

               children: [
               Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
               SizedBox(height: 40.h),

               Text(
               "12",
               style: GoogleFonts.roboto(
               fontSize: 32.sp,
               color: ColorsManager.white,
               fontWeight: FontWeight.bold,
               ),
               textAlign: TextAlign.center,
               ),
               SizedBox(height: 10.h),
               Text(
               "Wish List",
               style: GoogleFonts.roboto(
               fontSize: 22.sp,
               color: ColorsManager.white,
               fontWeight: FontWeight.bold,
               ),
               textAlign: TextAlign.center,
               ),
               ],
               ),
               SizedBox(width: 30.w,),
               Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
               SizedBox(height: 40.h),

               Text(
               "10",
               style: GoogleFonts.roboto(
               fontSize: 32.sp,
               color: ColorsManager.white,
               fontWeight: FontWeight.bold,
               ),
               ),
               SizedBox(height: 10.h),
               Text(
               "History",
               style: GoogleFonts.roboto(
               fontSize: 22.sp,
               color: ColorsManager.white,
               fontWeight: FontWeight.bold,
               ),
               ),
               ],
               ),
               ],
               ),
               ],
               ),
             ],
           ),
           ),
           ],
           ),
           SizedBox(height: 20.h),
           Row(
           children: [
           Expanded(
           flex: 2,
           child: CustomElevatedButton(
           text: "Edit Profile",
           onPress: () {},
           ),
           ),
           SizedBox(width: 16.w),
           Expanded(
           flex: 1,
           child: ElevatedButton(
           style: ElevatedButton.styleFrom(
           padding: REdgeInsets.all(15),
           foregroundColor: ColorsManager.white,
           backgroundColor: ColorsManager.red,
           shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(16.r),
           ),
           ),
           onPressed: () {},
           child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
           Text(
           "Exit",
           style: GoogleFonts.roboto(
           color: ColorsManager.white,
           fontSize: 20.sp,
           fontWeight: FontWeight.normal,
           ),
           ),
           SizedBox(width: 10.w),
           Icon(Icons.exit_to_app_outlined, size: 20.sp),
           ],
           ),
           ),
           ),
           ],
           ),
           ],
           ),
           ),

           DefaultTabController(
           length: 2,

           child: TabBar(
           indicatorColor: ColorsManager.yellow,
           indicatorSize: TabBarIndicatorSize.tab,
           indicatorWeight: 2.w,
           dividerColor: Colors.transparent,


           tabs: [
           Tab(

           icon: Icon(Icons.list, color: ColorsManager.yellow,size: 34.sp,),
           child: Text(
           "Watch List ",
           style: GoogleFonts.roboto(
           color: ColorsManager.white,
           fontSize: 20.sp,
           fontWeight: FontWeight.normal,
           ),
           ),
           ),
           Tab(
           icon: Icon(Icons.folder_rounded, color: ColorsManager.yellow,size: 34.sp,),
           child: Text(
           "History",
           style: GoogleFonts.roboto(
           color: ColorsManager.white,
           fontSize: 20.sp,
           fontWeight: FontWeight.normal,
           ),
           ),
           ),
           ],
           ),
           ),
           ],
           ),
           ),
           Column(

           children: [
           SizedBox(height: 150.h,),

           Image.asset(AssetsManager.empty,scale: 4.sp,),

           ],
           )

           ],
           );
             case LoadingProfileDataState():
              return Center(child: CircularProgressIndicator());
             case ErrorProfileDataState():
               if(state.generalException != null){
                 return Text(state.generalException.toString(),);
               }else{
                 return Text(state.serverError!);
               }
           }

         },

       ),
      ),
    );
  }
  void getUser()async{
   await  profileViewModel.getProfileData();
  }


}
