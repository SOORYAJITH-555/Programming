import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      List<String> emailParts = email.split('@');
      String name = emailParts[0];
      await _firestore.collection("users").doc(credential.user!.uid).set({
        'email': email,
        'name': name,
        'bio': 'empty bio ',
        'college': 'empty  ',
        'contact': 'empty ',
      });
      return credential.user;
    } catch (e) {
      print('Error signing up: $e');
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print('Error signing in: $e');
      return null;
    }
  }
}
