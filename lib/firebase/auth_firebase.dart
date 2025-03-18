import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

/*
  Future<bool> createUser(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      userCredential.user!.sendEmailVerification();
      return true;
    } catch (e) {
      return false;
    }
  }
  */

  Future<String> createUser(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;
      if (user != null) {
        await user.sendEmailVerification();
        return "success";
      }
      return "unknown_error";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return "email_exists";
      } else if (e.code == 'weak-password') {
        return "weak_password";
      }
      return "error";
    } catch (e) {
      return "error";
    }
  }

  Future<String> loginUser(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;
      if (user != null) {
        if (user.emailVerified) {
          return "success";
        } else {
          return "email_not_verified";
        }
      }
      return "invalid_credentials";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return "invalid_credentials";
      }
      return "error";
    } catch (e) {
      return "error";
    }
  }
}
