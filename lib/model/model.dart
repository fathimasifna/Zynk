class UserModel {
  final String? username;
  final String? email;
  final String? profileImage; 

  UserModel({this.username, this.email, this.profileImage});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['name'],
      email: map['mail-id'],
      profileImage: map['profileImage'], 
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'profileImage': profileImage, 
    };
  }
}
