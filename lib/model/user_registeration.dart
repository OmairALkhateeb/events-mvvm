// user_model.dart
class UserModel {
  final String name;
  final String email;
  final String phoneNumber;

  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
    );
  }
}
