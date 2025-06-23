import 'sign_up_data.dart';

/// message : "User created successfully"
/// data : {"email":"mahmoud@gmail.com","password":"$2b$10$FE3BP9l5NCNTozfEfi3q1ePhZqlfi0yKO5D5FgWxpv2Z7YVWoSsQS","name":"mahmoud abdallah","phone":"+201018116784","avaterId":1,"_id":"6857e1a8bb7f9635ef2f9776","createdAt":"2025-06-22T10:57:44.721Z","updatedAt":"2025-06-22T10:57:44.721Z","__v":0}

class SignUpResponse {
  SignUpResponse({
      this.message, 
      this.data,});

  SignUpResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? SignUpData.fromJson(json['data']) : null;
  }
  String? message;
  SignUpData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}