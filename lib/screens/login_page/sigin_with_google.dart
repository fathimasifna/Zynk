
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


  final FirebaseAuth _auth = FirebaseAuth.instance; 
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<User?> handleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount == null) {
        return null;
      }

      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

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
      print("Error during Google sign-in: $error");
      return null;
    }
  }

  