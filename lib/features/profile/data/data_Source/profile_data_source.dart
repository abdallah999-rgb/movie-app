import 'package:movie_app/core/result.dart';
import 'package:movie_app/features/profile/data/models/get_profile/user_data.dart';

abstract class ProfileDataSource{
  Future<Result<ProfileData>> getProfile();
}