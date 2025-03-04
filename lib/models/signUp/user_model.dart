import 'dart:typed_data';

class UserModel {
  int? id;
  String? username;
  String? email;
  String? password;
  Uint8List? image; 

  UserModel({
    this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.image,
  });

  // Convertir a Map para insertar en SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'image': image,
    };
  }

  // Convertir desde Map cuando obtenemos de la BD
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      password: map['password'],
      image: map['image'],
    );
  }
}
