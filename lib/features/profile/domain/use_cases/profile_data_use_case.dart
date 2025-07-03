import 'package:injectable/injectable.dart';
import 'package:movie_app/core/result.dart';
import 'package:movie_app/features/profile/domain/entities/profile_data_entity.dart';
import 'package:movie_app/features/profile/domain/repositories/profile_data_repo.dart';
@injectable
class ProfileDataUseCase{
  ProfileDataRepo profileDataRepo;
 @factoryMethod ProfileDataUseCase({required this.profileDataRepo});
  Future<Result<ProfileDataEntity>> getProfileData()async{
  return await  profileDataRepo.getProfile();
  }
}