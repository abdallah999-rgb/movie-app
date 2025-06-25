
class LoginResponse {
  LoginResponse({
      this.message,
      this.data,});



  LoginResponse.fromJson(dynamic json) {
    if (json["message"] is List) {
      message = (json['message'] as List).join(", ");
    } else {
      message = json['message']?.toString();
    }
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