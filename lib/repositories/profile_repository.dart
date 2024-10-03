import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:overshare2/features/profile/user_profile/models/user_profile_model.dart';

// class ProfileRepository extends GetxController {
//   static ProfileRepository get instance => Get.find();

//   final _docId = Get.put(UserProfileModel());

//   Widget build(BuildContext context) {
//     CollectionReference users = FirebaseFirestore.instance.collection('users');

//     return FutureBuilder<DocumentSnapshot>(
//         future: users.doc(_docId.documentId).get(),
//         builder: ((context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             Map<String, dynamic> data =
//                 snapshot.data!.data() as Map<String, dynamic>;
//             return Text("Hello ${data['username']}");
//           }
//           return const CircularProgressIndicator();
//         }));
//   }
// }

class ProfileRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserProfileModel?> fetchUserProfileByEmail() async {
    try {
      //ambil user yang sedang logged in
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        String email = currentUser.email!;

        //query untuk mengambil email yang sema dengan email yang sedang login
        QuerySnapshot query = await _firestore
            .collection('users')
            .where('email', isEqualTo: email)
            .limit(1) //maks 1 user
            .get();

        //convert hasil query ke usermodel
        if (query.docs.isNotEmpty) {
          return UserProfileModel.fromJson(query.docs.first.data() as Map<String, dynamic>);
          
        }
      }
    } catch (e) {
      print('ERROR FETCHING USER PROFILE: $e');
    }
    return null;
  }
}
