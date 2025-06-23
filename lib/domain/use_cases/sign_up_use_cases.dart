import 'package:movie_app/core/result.dart';
import 'package:movie_app/domain/entities/sign_up_entity.dart';
import 'package:movie_app/domain/repositories/authentication_repositories.dart';

class SignUpUseCases{
  AuthRepositories repositories;
  SignUpUseCases({required this.repositories});
  Future<Result<SignUpEntity>> invoke (SignUpEntity user)async{
 return await repositories.signUp(user);
  }
}