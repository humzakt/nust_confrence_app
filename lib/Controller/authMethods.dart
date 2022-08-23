import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to log In Admin
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Error! Something unexpected happened.';
    try {

        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = 'Success!';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Method to log out admin
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
