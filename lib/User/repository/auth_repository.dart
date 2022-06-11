import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'firebase_auth_api.dart';

class AuthRepository {
  final _firebaseAuthApi = FirebaseAuthApi();

  Future<UserCredential> signInFirebase() => _firebaseAuthApi.signIn();

  signOut() => _firebaseAuthApi.signOut();
}
