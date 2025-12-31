

import 'package:firebase_auth/firebase_auth.dart';

import '../ui/widgets/custom_snakbar.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign Up
  // Future<User?> signUp(String email, String password) async {
  //   final userCredential = await _auth.createUserWithEmailAndPassword(
  //     email: email,
  //     password: password,
  //   );
  //   return userCredential.user;
  // }

  Future<User?> signUp(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // Email already exists
        SnackBarCustom.failure("This email is already registered.");
        return null;
      } else if (e.code == 'invalid-email') {
        SnackBarCustom.failure("The email address is not valid.");
        return null;
      } else if (e.code == 'weak-password') {
        SnackBarCustom.failure("The password is too weak.");
        return null;
      } else {
        print('Error: ${e.message}');
        return null;
      }
    } catch (e) {
      // Any other errors
      print('Unexpected error: $e');
      return null;
    }
  }

  // Login
  Future<User?> login(String email, String password) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }
}
