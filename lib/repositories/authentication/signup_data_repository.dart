import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/instance_manager.dart';
import 'package:overshare2/features/authentication/signup/models/signup_model.dart';

class SignupDataRepository extends GetxController {
  static SignupDataRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  signupUserData(SignupModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(() => print("Berhasil Menambahkan User"))
        .catchError((error, stackTrace) {
      print(error.toString());
    });
  }
}
