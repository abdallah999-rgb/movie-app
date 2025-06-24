import 'package:movie_app/core/result.dart';
import 'package:movie_app/data/api_services/api_services.dart';
import 'package:movie_app/data/api_services/models/login/LoginResponse.dart';
import 'package:movie_app/data/api_services/models/sign_up/sign_up_data.dart';
import 'package:movie_app/data/data_source/login_data_source.dart';
import 'package:movie_app/domain/entities/login_entity.dart';
import 'package:movie_app/domain/entities/sign_up_entity.dart';

class LoginApiDataSource extends LoginDataSource{
  ApiServices apiServices;
  LoginApiDataSource({required this.apiServices});
  @override
  Future<Result<LoginResponse>> login(LoginEntity existedUser)async {
 return await  apiServices.login(existedUser);
  }

}