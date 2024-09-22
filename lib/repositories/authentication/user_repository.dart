import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/instance_manager.dart';
import 'package:overshare2/features/authentication/signup/models/signup_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //create user in database
  signupUserData(SignupModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .catchError((error, stackTrace) {
      print(error.toString());
    });
  }

  //mengambil data username user
  // Future<UserModel> getEmail(String email) async {
  //   final snapshot =
  //       await _db.collection('Users').where("email", isEqualTo: email).get();
  //   final emailData =
  //       snapshot.docs.map((e) => UserModel.fromDocumentSnapshot(e)).single;
  //   return emailData;
  // }
}
