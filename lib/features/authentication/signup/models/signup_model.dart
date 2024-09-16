class SignupModel {
  final String? id;
  final String username;
  final String phone;
  final String email;
  final String password;

  SignupModel(
      {this.id,
      required this.username,
      required this.phone,
      required this.email,
      required this.password});

  toJson() {
    return {
      'username': username,
      'phone_number': phone,
      'email': email,
      'password': password
    };
  }
}
