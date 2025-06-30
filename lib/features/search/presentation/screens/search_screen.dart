
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/assets_manager/assets_manager.dart';
import 'package:movie_app/core/colors_manager/colors_manager.dart';
import 'package:movie_app/core/dependency_injection/dio.dart';
import 'package:movie_app/features/search/presentation/widgets/movie_item.dart';
import 'package:movie_app/features/search/provider/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String clean = "";
  late TextEditingController searchController;
  late SearchViewModel searchProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadDate();
    searchController = TextEditingController();
  }

  loadDate() {
    searchProvider = getIt<SearchViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: REdgeInsets.all(10.0),
          child: ChangeNotifierProvider.value(
            value: searchProvider,
            child: ListView(
              children: [
                TextFormField(

                  controller: searchController,
                  autocorrect: true,
                  onChanged: (value) {
                    searchProvider.search(value);
                    searchProvider.searchListener = value;
                  },
                  cursorColor: ColorsManager.white,
                  style: GoogleFonts.roboto(
                    color: ColorsManager.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  decoration: InputDecoration(


                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: ColorsManager.white,
                      size: 30.sp,
                    ),
                    hintText: "Search",
                    hintStyle: GoogleFonts.roboto(
                      color: ColorsManager.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    filled: true,
                    fillColor: ColorsManager.faintBlack,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        color: ColorsManager.faintBlack,
                        width: 2.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        color: ColorsManager.faintBlack,
                        width: 2.w,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        color: ColorsManager.faintBlack,
                        width: 2.w,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        color: ColorsManager.red,
                        width: 2.w,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        color: ColorsManager.red,
                        width: 2.w,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Consumer<SearchViewModel>(
                  builder: (context, searchProvider, child) {

                    if (searchProvider.searchListener.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 250.h,),

                          Image.asset(AssetsManager.empty,scale: 3,),

                        ],
                      );
                    } else {
                      var state = searchProvider.searchState;
                      switch (state) {
                        case SuccessSearchState():
                          return GridView.builder(

                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                            itemCount: searchProvider.movies.length,
                            itemBuilder:
                                (context, index) => Padding(
                                  padding:  REdgeInsets.all(6),
                                  child: MovieItem(
                                    movieEntity: searchProvider.movies[index],
                                  ),
                                ),
                          );
                        case LoadingSearchState():
                          return Center(child: CircularProgressIndicator());

                        case ErrorSearchState():
                          return Center(
                            child: Text(
                               "Some Thing Went Wrong",
                              style: GoogleFonts.roboto(
                                fontSize: 18.sp,
                                color: ColorsManager.white,
                              ),
                            ),
                          );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
