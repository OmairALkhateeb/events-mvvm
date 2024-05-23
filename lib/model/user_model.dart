class LoginUser {
  final String role;

  LoginUser({required this.role});

  factory LoginUser.fromJson(Map<String, dynamic> json) {
    return LoginUser(
      role: json['role'],
    );
  }
}
