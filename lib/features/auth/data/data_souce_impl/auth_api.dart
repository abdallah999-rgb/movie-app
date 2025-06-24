import 'package:movie_app/core/result.dart';
import 'package:movie_app/features/auth/data/api_services/models/sign_up/sign_up_data.dart';
import 'package:movie_app/features/auth/data/data_source/auth_data_source.dart';
import 'package:movie_app/features/auth/domain/entities/sign_up_entity.dart';

import '../api_services/api_services.dart';

class AuthApiDataSourceImpl extends AuthDataSource {
  ApiServices apiServices;
  AuthApiDataSourceImpl({required this.apiServices});
  @override
  Future<Result<SignUpData>> signUp(SignUpEntity user) async {
    return await apiServices.signUp(user);
  }
}
