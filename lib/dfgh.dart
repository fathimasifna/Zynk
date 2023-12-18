import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
      
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult = await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      assert(user!.email != null);
      assert(user!.displayName != null);

      

      return user;
    } catch (error) {
      print("Error during Google sign in: $error");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your login form goes here

            ElevatedButton(
              onPressed: () async {
                User? user = await _handleSignIn();
                if (user != null) {
                  // Handle successful login
                  print("Google Sign-In successful");
                  print("User email: ${user.email}");
                } else {
                  // Handle login error
                  print("Google Sign-In failed");
                }
              },
              child: Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }
}