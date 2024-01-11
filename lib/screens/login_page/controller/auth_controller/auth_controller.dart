import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/screens/bottomnavigation/bottomnavigation.dart';
import 'package:dating_app/model/model.dart';
import 'package:dating_app/screens/login_page/screens/signin_page.dart';
import 'package:dating_app/screens/user_detailes/screens/user_detail_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

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
    var profileImage = ''.obs;

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage.value = pickedFile.path;
      await _uploadImageToFirebaseStorage(profileImage.value);
    }
  }


  Future<UserModel?> getUserInfo() async {
    try {
      var snapshot = await db
          .collection("users")
          .doc(auth.currentUser?.uid)
          .collection("profile")
          .get();

      if (snapshot.docs.isNotEmpty) {
        var data = snapshot.docs.first.data();
        return UserModel(username: data['username'], email: data['email']);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch user information: $e");
      return null;
    }
  }

  get formKey => null;

  signUp() async {
    try {
      loading.value = true;
      await auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      await addUser();
      Get.to(() => UserDetailsPage());
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
    clearUserData();
  }

  void clearUserData() {
    username.clear();
    email.clear();
    password.clear();
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

  // signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await googleSignIn.signIn();

  //     if (googleSignInAccount != null) {
  //       final GoogleSignInAuthentication googleSignInAuthentication =
  //           await googleSignInAccount.authentication;

  //       final AuthCredential authCredential = GoogleAuthProvider.credential(
  //         accessToken: googleSignInAuthentication.accessToken,
  //         idToken: googleSignInAuthentication.idToken,
  //       );

  //       await auth.signInWithCredential(authCredential);
  //       Get.to(() => const HomeScreen());
  //     } else {
  //       Get.snackbar("Sign In Canceled",
  //           "The user canceled the Google Sign In process.");
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     Get.snackbar("Error", "$e");
  //   } catch (e) {
  //     Get.snackbar("Error", "An unexpected error occurred: $e");
  //   }
  // }
   Future<void> _uploadImageToFirebaseStorage(String filePath) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final String uid = user?.uid ?? '';
      String fileName = 'profile_image_$uid.jpg';
      Reference storageReference =
          FirebaseStorage.instance.ref().child('profile_images/$fileName');
      UploadTask uploadTask = storageReference.putFile(File(filePath));
      await uploadTask.whenComplete(() => null);

      String imageUrl = await storageReference.getDownloadURL();

      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'profileImage': imageUrl,
      });
    } catch (e) {
      ('Error uploading image to Firestore: $e');
    }
  }

  void listenToProfileChanges(String uid) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data();
        if (data != null && data.containsKey('profileImage')) {
          profileImage.value = data['profileImage'];
        }
      }
    });
  }
}
