import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final formKey;
  final snakeBar;
  AuthService({
    this.formKey,
    this.snakeBar,
  });

  /// Sign Up With Email & Password
  Future<dynamic> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      if (formKey.currentState!.validate()) {
        final UserCredential _authResult = await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        User? user = _authResult.user;
        await user!.updateDisplayName(name);
        await user.reload();
        return user;
      }
    } on FirebaseAuthException catch (e) {
      snakeBar(e);
    }
    return null;
  }

  /// Sign In With Email & Password
  Future<dynamic> signInWithEmailAndPassword({
    required email,
    required password,
  }) async {
    try {
      if (formKey.currentState!.validate()) {
        final UserCredential _authResult =
            await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        User? user = _authResult.user;
        return user;
      }
    } on FirebaseAuthException catch (e) {
      snakeBar(e);
    }
    return null;
  }

  /// Sign Out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
