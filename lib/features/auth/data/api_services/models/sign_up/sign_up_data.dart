

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
  int? avaterId;
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