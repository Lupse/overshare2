import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:overshare2/features/authentication/signup/screens/signup_success.dart';
import 'package:overshare2/repositories/authentication/exception/signup_exception.dart';
import 'package:overshare2/views/homepage.dart';
import 'package:overshare2/views/landing_page.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 3));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    //perhatikan bagian else nya
    user == null
        ? Get.offAll(() => const LandingPage())
        : Get.offAll(() => const LandingPage());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const SignupSuccess())
          : Get.to(() => const LandingPage());
    } on FirebaseAuthException catch (e) {
      print(e);
      print(e.runtimeType);
      print(e.code);
      //   final ex = AuthException.code(e.code);
      //   print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      //   print(e.code);
      // } catch (_) {
      //   const ex = AuthException();
      //   print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      //throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const Homepage())
          : Get.to(() => const LandingPage());
    } on FirebaseAuthException catch (e) {
      final ex = AuthException.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
    } catch (_) {
      const ex = AuthException();
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
    }
  }

  Future<void> logoutUser() async => await _auth.signOut();
}
