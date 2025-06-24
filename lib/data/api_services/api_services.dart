import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/result.dart';
import 'package:movie_app/data/api_services/models/login/LoginResponse.dart';
import 'package:movie_app/data/api_services/models/sign_up/sign_up_data.dart';
import 'package:movie_app/data/api_services/models/sign_up/sign_up_response.dart';
import 'package:movie_app/domain/entities/login_entity.dart';
import 'package:movie_app/domain/entities/sign_up_entity.dart';

class ApiServices {
  static const String _baseUrl = "route-movie-apis.vercel.app";
  static const String _registerEndPoint = "auth/register";
  static const String _loginEndPoint = "auth/login";

  Future<Result<SignUpData>> signUp(SignUpEntity user) async {
    try {
      Uri url = Uri.https(_baseUrl, _registerEndPoint);
      http.Response response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "name": user.name,
          "email": user.email,
          "password": user.password,
          "confirmPassword": user.confirmPassword,
          "phone": user.phone,
          "avaterId": 1,
        }),
      );
      var json = jsonDecode(response.body);
      SignUpResponse signUpResponse = SignUpResponse.fromJson(json);
      if (response.statusCode == 200) {
        return Success(data: signUpResponse.data!);
      } else {
        log(signUpResponse.message!);

        return ServerError(message: signUpResponse.message!);
      }
    } on Exception catch (e) {
      print(
        "success++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++",
      );

      return GeneralException(exception: e);
    }
  }

  Future<Result<LoginResponse>> login(LoginEntity existedUser) async {

    try{
      Uri url = Uri.https(_baseUrl, _loginEndPoint);
      http.Response response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": existedUser.email,
          "password": existedUser.password,
        }),
      );

      var json = jsonDecode(response.body);
      LoginResponse loginResponse = LoginResponse.fromJson(json);
      if(response.statusCode == 200){
        print("0000000000000000000000000000000000000000000000000000");
        print(loginResponse.data);
        return Success(data: loginResponse);
      }else{
        return ServerError(message: loginResponse.message!);
      }
    } on Exception catch(e){
      return GeneralException(exception: e);
    }


  }
}
