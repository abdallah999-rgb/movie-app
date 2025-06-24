import 'package:movie_app/core/result.dart';
import 'package:movie_app/data/api_services/models/login/LoginResponse.dart';
import 'package:movie_app/domain/entities/login_entity.dart';
import 'package:movie_app/domain/repositories/login_repository.dart';

class LoginUseCases{
  LoginRepository loginRepository;
  LoginUseCases({required this.loginRepository});
  Future<Result<LoginResponse>> invoke(LoginEntity existedUser)async{
    return await loginRepository.login(existedUser);
  }
}