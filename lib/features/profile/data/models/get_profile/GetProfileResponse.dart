import 'user_data.dart';

/// message : "Profile fetched successfully"
/// data : {"_id":"68665de277affbc758e3bd5a","email":"mahmoud123456@gmail.com","password":"$2b$10$R9RKwixUBVlnCUuwYSM7F.oTRJTuSL8LfbOpOy5F4N9N3Dg0FtkA2","name":"mahmouddddd","phone":"+201141209334","avaterId":1,"createdAt":"2025-07-03T10:39:30.239Z","updatedAt":"2025-07-03T10:39:30.239Z","__v":0}

class GetProfileResponse {
  GetProfileResponse({
      this.message, 
      this.data,});

  GetProfileResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
  }
  String? message;
  ProfileData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}