// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserModel {
//   final String? id;
//   final String username;
//   final String phone;
//   final String email;
//   final String password;

//   UserModel(
//       {required this.id,
//       required this.username,
//       required this.phone,
//       required this.email,
//       required this.password});

//   factory UserModel.fromDocumentSnapshot(
//       DocumentSnapshot<Map<String, dynamic>> document) {
//     final data = document.data()!;
//     return UserModel(
//         id: document.id,
//         username: data['username'],
//         phone: data['phone_number'],
//         email: data['email'],
//         password: data['password']);
//   }
// }

class UserProfileModel {
  final String username;

  UserProfileModel({required this.username});

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(username: json['username']);
  }

  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return UserModel(username: json['username']);
  // }
}
