import 'package:movie_app/core/result.dart';
import 'package:movie_app/features/auth/data/api_services/models/sign_up/sign_up_data.dart';
import 'package:movie_app/features/auth/domain/entities/sign_up_entity.dart';

abstract class AuthDataSource {
  Future<Result<SignUpData>> signUp(SignUpEntity user);
}
