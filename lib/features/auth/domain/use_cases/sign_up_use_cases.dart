import 'package:injectable/injectable.dart';
import 'package:movie_app/core/result.dart';
import 'package:movie_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:movie_app/features/auth/domain/repositories/authentication_repositories.dart';
@injectable
class SignUpUseCases {
  AuthRepositories repositories;
  @factoryMethod
  SignUpUseCases({required this.repositories});
  Future<Result<SignUpEntity>> invoke(SignUpEntity user) async {
    return await repositories.signUp(user);
  }
}
