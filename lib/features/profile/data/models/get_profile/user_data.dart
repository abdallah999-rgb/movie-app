import '../../../domain/entities/profile_data_entity.dart';

/// _id : "68665de277affbc758e3bd5a"
/// email : "mahmoud123456@gmail.com"
/// password : "$2b$10$R9RKwixUBVlnCUuwYSM7F.oTRJTuSL8LfbOpOy5F4N9N3Dg0FtkA2"
/// name : "mahmouddddd"
/// phone : "+201141209334"
/// avaterId : 1
/// createdAt : "2025-07-03T10:39:30.239Z"
/// updatedAt : "2025-07-03T10:39:30.239Z"
/// __v : 0

class ProfileData {
  ProfileData({
      this.id, 
      this.email, 
      this.password, 
      this.name, 
      this.phone, 
      this.avaterId, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  ProfileData.fromJson(dynamic json) {
    id = json['_id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    avaterId = json['avaterId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? email;
  String? password;
  String? name;
  String? phone;
  int? avaterId;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['phone'] = phone;
    map['avaterId'] = avaterId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
  ProfileDataEntity toEntity() {
    return ProfileDataEntity(
      id: id,
      email: email,
      password: password,
      name: name,
      phone: phone,
      avaterId: avaterId,
    );
  }

}