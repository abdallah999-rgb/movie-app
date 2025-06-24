import 'package:movie_app/core/result.dart';
import 'package:movie_app/data/api_services/models/login/LoginResponse.dart';
import 'package:movie_app/domain/entities/login_entity.dart';

abstract class LoginRepository{
  Future<Result<LoginResponse>>login(LoginEntity existedUser);
}