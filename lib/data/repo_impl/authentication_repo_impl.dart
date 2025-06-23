import 'package:movie_app/core/result.dart';
import 'package:movie_app/data/api_services/models/sign_up/sign_up_data.dart';
import 'package:movie_app/data/data_source/auth_data_source.dart';
import 'package:movie_app/domain/entities/sign_up_entity.dart';
import 'package:movie_app/domain/repositories/authentication_repositories.dart';

class AuthRepoImpl extends AuthRepositories{
  AuthDataSource authDataSource;
  AuthRepoImpl({required this.authDataSource});



  @override
  Future<Result<SignUpEntity>> signUp(SignUpEntity user) async{
   var result = await authDataSource.signUp(user);
   switch(result) {
     case Success<SignUpData>():
      return Success(data: result.data as SignUpEntity);
     case ServerError<SignUpData>():
      return ServerError(message: result.message);
     case GeneralException<SignUpData>():
      return GeneralException(exception: result.exception);
   }
  }}