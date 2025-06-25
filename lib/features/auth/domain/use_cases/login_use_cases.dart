import 'package:movie_app/core/result.dart';
import 'package:movie_app/features/auth/data/api_services/models/login/login_response.dart';
import 'package:movie_app/features/auth/domain/entities/login_entity.dart';
import 'package:movie_app/features/auth/domain/repositories/login_repository.dart';

class LoginUseCases {
  LoginRepository loginRepository;
  LoginUseCases({required this.loginRepository});
  Future<Result<LoginResponse>> invoke(LoginEntity existedUser) async {
    return await loginRepository.login(existedUser);
  }
}
