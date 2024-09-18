import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  static final _fireStore = FirebaseFirestore.instance;

  static Future<UserCredential> signUp(
      {required String email, required String password}) async {
    final auth = FirebaseAuth.instance;
    final userCredentials = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    final userData = {
      'email': userCredentials.user?.email,
      'password': password,
      'uid': userCredentials.user?.uid,
    };
    await _fireStore
        .collection('user')
        .doc(userCredentials.user?.uid)
        .set(userData);
    
    await _fireStore.collection('cart').doc(userCredentials.user?.uid).set({});

    return userCredentials;
  }
}
