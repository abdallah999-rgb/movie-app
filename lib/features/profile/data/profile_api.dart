import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:movie_app/features/profile/data/models/get_profile/GetProfileResponse.dart';
import 'package:movie_app/features/profile/data/models/get_profile/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/result.dart';
@singleton
class ProfileApi {
  static const String _baseUrl = "route-movie-apis.vercel.app";
  static const String _getProfileEndPoint = "profile";
  static late String registerError;
  static late String profileError;

Future<Result<ProfileData>>  getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    try {
      Uri url = Uri.https(_baseUrl, _getProfileEndPoint);
      http.Response response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      var json = jsonDecode(response.body);
      GetProfileResponse getProfileResponse = GetProfileResponse.fromJson(json);
      if (response.statusCode == 200) {

        return Success(data: getProfileResponse.data!);
      } else {
        profileError = getProfileResponse.message!;
        return ServerError(message: getProfileResponse.message!);
      }


    } on Exception catch (e) {
     return GeneralException(exception: e);

    }
  }
}
