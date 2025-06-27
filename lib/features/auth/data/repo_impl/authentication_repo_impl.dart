import 'package:movie_app/core/result.dart';
import 'package:movie_app/features/auth/data/api_services/models/sign_up/sign_up_data.dart';
import 'package:movie_app/features/auth/data/data_source/auth_data_source.dart';
import 'package:movie_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:movie_app/features/auth/domain/repositories/authentication_repositories.dart';

class AuthRepoImpl implements AuthRepositories {
  AuthDataSource authDataSource;
  AuthRepoImpl({required this.authDataSource});

  @override
  Future<Result<SignUpEntity>> signUp(SignUpEntity user) async {
    var result = await authDataSource.signUp(user);
    switch (result) {
      case Success<SignUpData>():
        return Success(data: result.data.toEntity());
      case ServerError<SignUpData>():
        return ServerError(message: result.message);
      case GeneralException<SignUpData>():
        return GeneralException(exception: result.exception);
    }
  }
}

extension SignUpDataMapper on SignUpData {
  SignUpEntity toEntity() {
    return SignUpEntity(
      name: name ?? '',
      email: email ?? '',
      password: password ?? '',
      confirmPassword: confirmPassword ?? '',
      phone: phone ?? '',
      avaterId: avaterId ?? 1,
    );
  }
}
