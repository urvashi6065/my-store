import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  static Future<UserCredential> signUp(
      {required String email, required String password}) async {
    final auth = FirebaseAuth.instance;
    final userCredentials = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredentials;
  }

}
