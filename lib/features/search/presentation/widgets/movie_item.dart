import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/colors_manager/colors_manager.dart';
import 'package:movie_app/features/search/domain/entities/movie_entity.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movieEntity, });
final MovieEntity movieEntity;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 500.h,
      width:double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: DecorationImage(image: NetworkImage(movieEntity.largeCoverImage!),fit: BoxFit.fill)
      ),
      child: Stack(
        children: [
          Container(
            margin: REdgeInsets.all(8),

            height: 30.h,
            width: 60.w,
            decoration: BoxDecoration(
              color: ColorsManager.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12.r)
                  
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${movieEntity.rating!}",style: TextStyle(color: ColorsManager.white,fontSize: 16.sp,fontWeight: FontWeight.normal),),
                SizedBox(width: 5.w,),
                Icon(Icons.star,color: ColorsManager.faintYellow,size: 20.sp,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
