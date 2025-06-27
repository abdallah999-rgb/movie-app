import 'package:movie_app/core/result.dart';
import 'package:movie_app/features/auth/data/api_services/models/login/login_response.dart';
import 'package:movie_app/features/auth/data/data_source/login_data_source.dart';
import 'package:movie_app/features/auth/domain/entities/login_entity.dart';
import 'package:movie_app/features/auth/domain/repositories/login_repository.dart';

class LoginRepoImpl implements LoginRepository {
  LoginDataSource loginDataSource;
  LoginRepoImpl({required this.loginDataSource});
  @override
  Future<Result<LoginResponse>> login(LoginEntity existedUser) async {
    var result = await loginDataSource.login(existedUser);
    switch (result) {
      case Success<LoginResponse>():
        print(result);
        return Success(data: result.data);
      case ServerError<LoginResponse>():
        return ServerError(message: result.message);
      case GeneralException<LoginResponse>():
        return GeneralException(exception: result.exception);
    }
  }
}
