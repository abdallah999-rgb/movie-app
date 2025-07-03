import 'package:movie_app/features/profile/domain/entities/profile_data_entity.dart';

import '../../../../core/result.dart';

abstract class ProfileDataRepo{
  Future<Result<ProfileDataEntity>> getProfile();

}