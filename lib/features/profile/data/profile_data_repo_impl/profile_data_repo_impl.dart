import 'package:injectable/injectable.dart';
import 'package:movie_app/core/result.dart';
import 'package:movie_app/features/profile/data/data_Source/profile_data_source.dart';
import 'package:movie_app/features/profile/data/models/get_profile/user_data.dart';
import 'package:movie_app/features/profile/domain/entities/profile_data_entity.dart';
import 'package:movie_app/features/profile/domain/repositories/profile_data_repo.dart';
@Injectable(as:ProfileDataRepo )
class ProfileDataRepoImpl implements ProfileDataRepo{
  ProfileDataSource profileDataSource;
 @factoryMethod ProfileDataRepoImpl({required this.profileDataSource});
  @override
  Future<Result<ProfileDataEntity>> getProfile()async {
  var result =  await   profileDataSource.getProfile();
  switch(result){
    
    case Success<ProfileData>():
    return Success(data: result.data.toEntity());
    case ServerError<ProfileData>():
    return ServerError(message: result.message);
    case GeneralException<ProfileData>():
      return GeneralException(exception: result.exception);

  }
  
  }
  
}