import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/screens/HomeScreen/home_page.dart';
import 'package:dating_app/screens/bottomnavigation/bottomnavigation.dart';
import 'package:dating_app/screens/login_page/controller/model/model.dart';
import 'package:dating_app/screens/login_page/screens/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController loginemail = TextEditingController();
  TextEditingController restemail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  var loading = false.obs;
  final googleSignIn = GoogleSignIn();

  get formKey => null;

  signUp() async {
    try {
      loading.value = true;
      await auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      await addUser();
      Get.to(() =>  BottomNavigation());
      loading.value = false;
    } catch (e) {
      handleAuthError(e);
    } finally {
      loading.value = false;
    }
  }

   Future<void> addUser() async {
    try {
      UserModel user = UserModel(
        username: username.text,
        email: auth.currentUser?.email,
      );

      await db
          .collection("users")
          .doc(auth.currentUser?.uid)
          .collection("profile")
          .add(user.toMap());
    } catch (e) {
      ("Error adding user to Firestore: $e");
    }
  }

  signOut() async {
    await auth.signOut();
  }

  signIn() async {
    try {
      loading.value = true;
      await auth.signInWithEmailAndPassword(
          email: loginemail.text, password: loginPassword.text);
      Get.to(() => BottomNavigation());
      loading.value = false;
    } catch (e) {
      handleAuthError(e);
    } finally {
      loading.value = false;
    }
  }

  Future<void> resetPassword() async {
    try {
      loading.value = true;
      await auth.sendPasswordResetEmail(email: restemail.text);
      Get.snackbar("Email", "Password reset email sent successfully");
      Get.to(const SignIn());
    } catch (e) {
      Get.snackbar("Error", "Password reset failed: ${e.toString()}");
    } finally {
      loading.value = false;
    }
  }

  void handleAuthError(dynamic error) {
    Get.snackbar("Error", "$error");
  }

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await auth.signInWithCredential(authCredential);
        Get.to(() =>  HomeScreen());
      } else {
        Get.snackbar("Sign In Canceled",
            "The user canceled the Google Sign In process.");
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", "$e");
    } catch (e) {
      Get.snackbar("Error", "An unexpected error occurred: $e");
    }
  }
}

