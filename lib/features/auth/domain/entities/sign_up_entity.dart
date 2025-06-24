class SignUpEntity {
  String? email;
  String? password;
  String? confirmPassword;
  String? name;
  String? phone;
  int? avaterId;

  SignUpEntity(
      {required this.email, required this.password,  required this.name, required this.phone, required this.avaterId,required this.confirmPassword});
}