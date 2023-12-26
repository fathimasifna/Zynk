class UserModel {
  final String? username;
  final String? email;

  UserModel({this.username, this.email});

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
    };
  }
}