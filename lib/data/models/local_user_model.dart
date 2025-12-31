import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// A simple user model for storing in SharedPreferences
class LocalUser {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoURL;

  LocalUser({
    required this.uid,
    this.email,
    this.displayName,
    this.photoURL,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
    };
  }

  factory LocalUser.fromJson(Map<String, dynamic> json) {
    return LocalUser(
      uid: json['uid'],
      email: json['email'],
      displayName: json['displayName'],
      photoURL: json['photoURL'],
    );
  }
}