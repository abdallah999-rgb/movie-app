import 'package:movie_app/core/result.dart';
import 'package:movie_app/features/auth/domain/entities/sign_up_entity.dart';

abstract class AuthRepositories {
  Future<Result<SignUpEntity>> signUp(SignUpEntity user);
}
