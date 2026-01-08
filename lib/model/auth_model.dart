class UserModel {
  final int id;
  final String username;
  final String email;
  final String? image;
  final bool isActive;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.image,
    required this.isActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      image: json['image'],
      isActive: json['is_active'] == 1 || json['is_active'] == true,
    );
  }
}
