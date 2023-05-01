import 'package:firebase_auth/firebase_auth.dart';

class SignInModule {
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

class RegisterModule {
  static Future<User> registerUsingEmailPassword({
    String email,
    String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user.updateDisplayName(email);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'weak-password') {
        errorMessage = 'Your password is too weak';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'Your email is already registered, try sign in';
      } else {
        errorMessage = 'Unknown error, please try again later';
      }
      throw Exception(errorMessage);
    } catch (e) {
      print(e.toString());
      throw Exception('Unknown error, please try again later');
    }
    return user;
  }
}
