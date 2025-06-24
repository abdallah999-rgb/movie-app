import 'package:movie_app/data/api_services/models/sign_up/sign_up_data.dart';

/// message : "Success Login"
/// data : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4NWE2MDMyYzEzMDExOWIxMjM3MTAzYyIsImVtYWlsIjoibWFoOTlAZ21haWwuY29tIiwiaWF0IjoxNzUwNzUzMzcxfQ.hez9Cgi4y8o7cDG3DGChpr8KvfGKT25ZIKvBo6x-OwI"

class LoginResponse {
  LoginResponse({
      this.message,
      this.data,});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'];
  }
  String? message;
  String? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}