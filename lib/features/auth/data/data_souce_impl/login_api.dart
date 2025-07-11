import 'package:injectable/injectable.dart';
import 'package:movie_app/core/result.dart';
import 'package:movie_app/features/auth/data/api_services/api_services.dart';
import 'package:movie_app/features/auth/data/api_services/models/login/login_response.dart';
import 'package:movie_app/features/auth/data/data_source/login_data_source.dart';
import 'package:movie_app/features/auth/domain/entities/login_entity.dart';

@Injectable(as: LoginDataSource)
class LoginApiDataSource implements LoginDataSource {
  ApiServices apiServices;
  @factoryMethod
  LoginApiDataSource({required this.apiServices});
  @override
  Future<Result<LoginResponse>> login(LoginEntity existedUser) async {
    return await apiServices.login(existedUser);
  }
}
