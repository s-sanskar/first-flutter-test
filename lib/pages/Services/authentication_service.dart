import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter_app/pages/screens/sign_in.dart';
import 'package:flutter/material.dart';

class AuthenticationServices {
  final FirebaseAuth _firebaseAuth;
  AuthenticationServices(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> signIn(
      String email, String password, BuildContext context) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Ops! Login Failed"),
          content: const Text('Please try again'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Okay'),
            )
          ],
        ),
      );
    }
  }

  Future<void> signUp(
      String email, String password, BuildContext context) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.blueGrey,
          content: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Sucessfully Registered. You Can Login Now'),
          ),
          duration: Duration(seconds: 5),
        ),
      );
      Navigator.of(context).pop();

      await Navigator.of(context).push(MaterialPageRoute(
        builder: (contex) => LoginSignIn(),
      ));
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text(' Ops! Registration Failed'),
          content: const Text('An Error Occurred'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Okay'),
            )
          ],
        ),
      );
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
