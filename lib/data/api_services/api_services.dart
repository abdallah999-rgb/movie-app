import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/result.dart';
import 'package:movie_app/data/api_services/models/sign_up/sign_up_data.dart';
import 'package:movie_app/data/api_services/models/sign_up/sign_up_response.dart';
import 'package:movie_app/domain/entities/sign_up_entity.dart';

class ApiServices {
  static const String _baseUrl =
      "route-movie-apis.vercel.app";
  static const String _authEndPoint = "auth/register";

   Future<Result<SignUpData>> signUp(SignUpEntity user) async {
    try {
      Uri url = Uri.https(_baseUrl, _authEndPoint);
      http.Response response = await http.post(
        url,
        body: {

            "name":user.name,
            "email":user.email,
            "password":user.password,
            "phone":user.phone,
            "avaterId":1

        },


      );
      var json = jsonDecode(response.body);
      SignUpResponse signUpResponse = SignUpResponse.fromJson(json);
      if (response.statusCode == 200) {
        return Success(data: signUpResponse.data!);
      } else {

        return ServerError(message: signUpResponse.message!);
      }
    } on Exception catch (e) {
      print("success++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");

      return GeneralException(exception: e);
    }
  }
}
