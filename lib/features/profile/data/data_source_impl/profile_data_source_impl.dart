import 'package:injectable/injectable.dart';
import 'package:movie_app/core/result.dart';
import 'package:movie_app/features/profile/data/data_Source/profile_data_source.dart';
import 'package:movie_app/features/profile/data/models/get_profile/user_data.dart';
import 'package:movie_app/features/profile/data/profile_api.dart';
@Injectable(as: ProfileDataSource)
class ProfileDataSourceImpl implements ProfileDataSource{
  ProfileApi profileApi;
 @factoryMethod ProfileDataSourceImpl({required this.profileApi});
  @override
  Future<Result<ProfileData>> getProfile()async {
   return await profileApi.getProfile();

  }

}