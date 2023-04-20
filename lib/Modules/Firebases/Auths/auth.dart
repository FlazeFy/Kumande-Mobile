import 'package:firebase_auth/firebase_auth.dart';

class AuthModule {
  final FirebaseAuth _fireAuth = FirebaseAuth.instance;

  User get currentUser => _fireAuth.currentUser;
  Stream<User> get authStateChanges => _fireAuth.authStateChanges();

  Future<void> signInEmailPass({String email, String password}) async {
    final credentials =
        EmailAuthProvider.credential(email: email, password: password);
    await _fireAuth.signInWithCredential(credentials);
  }

  Future<void> addUserEmailPass({String email, String password}) async {
    await _fireAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> logOut() async {
    await _fireAuth.signOut();
  }
}
