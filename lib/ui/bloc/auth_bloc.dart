import 'package:ecogo_booking/ui/screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/app_constants.dart';
import '../../data/models/local_user_model.dart';
import '../../helper/auth_helper.dart';
import '../../helper/shared_preperence_helper.dart';
import '../screens/dashBoard/dashboard_screen.dart';
import '../widgets/custom_snakbar.dart';

class AuthBloc{
  final AuthService _auth = AuthService();

  // Sign Up
  Future<User?> signUp({required String email,required String password})async {
    try {
      var firebaseUser = await _auth.signUp(email, password);
      navigateDashBoard(firebaseUser:firebaseUser);
    } catch (e) {
      print(e);
    }
  }

  Future<User?> login({required String email,required String password})async {
    try {
      var firebaseUser =await _auth.login(email, password);
      navigateDashBoard(firebaseUser:firebaseUser);
    } catch (e) {
      print(e);
    }
  }

   Future navigateDashBoard({required User? firebaseUser})async{
     if (firebaseUser != null) {
       final localUser = LocalUser(
         uid: firebaseUser.uid,
         email: firebaseUser.email,
         displayName: firebaseUser.displayName,
         photoURL: firebaseUser.photoURL,
       );
       await SharedPrefService.instance.saveUser(localUser);
       Navigator.pushReplacementNamed(AppConstants.globalNavigatorKey.currentState!.context, DashboardScreen.path);

     }
  }
  // Logout
  Future<void> logout() async {
    await _auth.logout();
    await SharedPrefService.instance.removeUser();
    Navigator.pushReplacementNamed(AppConstants.globalNavigatorKey.currentState!.context, LoginScreen.path);
  }

  bool validation({
    required String email,
    required String password,
    String? confirmPassword,
    bool? isFromSignUp = false
  }) {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      SnackBarCustom.failure("Enter your password");
      return false;
    }

    if (password.length < 6) {
      SnackBarCustom.failure("Password must be contain 6 characters");
      return false;
    }
   if(isFromSignUp == true){
     if(password != confirmPassword){
       SnackBarCustom.failure("Password and confirm password should be same");
       return false;
     }
   }
    final emailRegex =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(email.trim())) {
      SnackBarCustom.failure("Invalid email");
      return false;
    }

    return true;
  }

}