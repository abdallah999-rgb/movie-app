import 'package:movie_app/core/result.dart';
import 'package:movie_app/features/auth/data/api_services/models/login/LoginResponse.dart';
import 'package:movie_app/features/auth/domain/entities/login_entity.dart';

abstract class LoginDataSource {
  Future<Result<LoginResponse>> login(LoginEntity existedUser);
}
