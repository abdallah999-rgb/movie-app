/// email : "mahmoud@gmail.com"
/// password : "$2b$10$FE3BP9l5NCNTozfEfi3q1ePhZqlfi0yKO5D5FgWxpv2Z7YVWoSsQS"
/// name : "mahmoud abdallah"
/// phone : "+201018116784"
/// avaterId : 1
/// _id : "6857e1a8bb7f9635ef2f9776"
/// createdAt : "2025-06-22T10:57:44.721Z"
/// updatedAt : "2025-06-22T10:57:44.721Z"
/// __v : 0

class SignUpData {
  SignUpData({
      this.email, 
      this.password,
    this.confirmPassword,
      this.name, 
      this.phone, 
      this.avaterId, 
      this.id,
      this.createdAt,
      this.updatedAt,
      this.v,});

  SignUpData.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    confirmPassword= json["confirmPassword"];
    name = json['name'];
    phone = json['phone'];
    avaterId = json['avaterId'] ;
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? email;
  String? password;
  String? confirmPassword;
  String? name;
  String? phone;
  String? avaterId;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map["confirmPassword"]= confirmPassword;
    map['name'] = name;
    map['phone'] = phone;
    map['avaterId'] = avaterId;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}