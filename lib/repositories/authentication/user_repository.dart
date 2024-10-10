import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/instance_manager.dart';
import 'package:overshare2/features/authentication/signup/models/signup_model.dart';
import 'package:overshare2/repositories/authentication/authentication_repository.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final AuthenticationRepository authenticationRepository = Get.find();

  final _db = FirebaseFirestore.instance;

  FirebaseFirestore get db => _db;

  //create user in database
  signupUserData(SignupModel user) async {
    await _db
        .collection('users')
        .doc(authenticationRepository.userId)
        .set(user.toJson())
        .then((docRef) async {
          // setelah user signup, buat empty favourite collection
          await _db
              .collection('users')
              .doc(authenticationRepository.userId)
              .collection('favourites')
              .add({
            'initialized': true,
          });
        })
        .whenComplete(() =>
            // ignore: avoid_print
            print('USER REPOSITORY - berasil memasukkan data ke database'))
        // ignore: body_might_complete_normally_catch_error
        .catchError((error, stackTrace) {
          // ignore: avoid_print
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
