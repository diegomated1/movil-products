class UserModel {
  UserModel({
    required this.idUser,
    required this.username,
    required this.email,
  });
  
  final String idUser;
  final String username;
  final String email;

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      idUser: json['id_user'],
      username: json['username'],
      email: json['email'],
    );
  }
}