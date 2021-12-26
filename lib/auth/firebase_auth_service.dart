import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static User? get currentUser => _auth.currentUser;

  static Future<bool> loginUser (String email, String password) async {
    final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return result.user != null;
  }

  static Future<bool> registerUser (String email, String password) async {
    final result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return result.user != null;
  }

  static bool get isEmailVerified => _auth.currentUser?.emailVerified ?? false;

  static void sendVerificationMail() => _auth.currentUser?.sendEmailVerification();

  static Future<void> logout(){
    return _auth.signOut();
  }
}