import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_application_1/storage/user_preference.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthenticationProvider extends ChangeNotifier {
  UserCredential? userCredential;
  bool isLoading = false;

  Future<void> createAccount({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      log(credential.toString());
      userCredential = credential;
      notifyListeners();
      UserPreference.saveUserData(true);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: e.message ?? 'Something Went Wrong');

        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
        Fluttertoast.showToast(msg: e.message ?? 'Something Went Wrong');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> signinAccount({
    required String email,
    required String password,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      log(credential.toString());
      userCredential = credential;
      notifyListeners();
      UserPreference.saveUserData(true);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message ?? 'Something went wrong');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
