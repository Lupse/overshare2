import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:overshare2/features/profile/user_profile/models/user_model.dart';

class UserProfileController extends GetxController {
  static UserProfileController get instance => Get.find();

  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<UserModel?> getUsername() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc =
            await _fireStore.collection('Users').doc(user.uid).get();
        if (userDoc.exists) {
          String username = userDoc['username'];
          return UserModel(username: username);
        } else {
          throw "Can't Find Username";
        }
      } else {
        throw 'No User Logged In';
      }
    } catch (e) {
      throw 'Failed To Catch User Data';
    }
  }

  // getUsername() {
  //   final email = _authRepo.firebaseUser.value?.email;

  //   if (email != null) {
  //     return _userRepo.getEmail(email);
  //   } else {
  //     //gant pakai snackbar nanti
  //     Get.snackbar("Error", "Login First To Continue");
  //   }
  // }
}
