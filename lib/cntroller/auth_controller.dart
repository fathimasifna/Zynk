import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/model/user_model.dart';
import 'package:dating_app/screens/HomeScreen/home_page.dart';
import 'package:dating_app/screens/login_page/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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

  signUp() async {
    try {
      loading.value = true;
      await auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      await addUser();

      Get.to(() => HomeScreen());
    } catch (e) {
      Get.snackbar("Error", "$e");
    } finally {
      loading.value = false;
    }
  }

  //add user in database
  addUser() async {
    UserModel user = UserModel(
      username: username.text,
      email: auth.currentUser?.email,
    );

    db
        .collection("users")
        .doc(auth.currentUser?.uid)
        .collection("profile")
        .add(user.toMap());
  }

  signOut() async {
    await auth.signOut();
  }

  signIn() async {
    try {
      loading.value = true;

      await auth.signInWithEmailAndPassword(
          email: loginemail.text, password: loginPassword.text);
      Get.to(() => HomeScreen());
      loading.value = false;
    } catch (e) {
      Get.snackbar("error", "$e");
      loading.value = false;
    }
  }

  
  restPassword() async {
    try{
      loading.value=true;
    auth.sendPasswordResetEmail(email: restemail.text);
    Get.snackbar("email", "send successfully");
    Get.to(const SignIn());
    loading.value=false;
    }
    catch(e){
      Get.snackbar("error", "$e");
      loading.value=false;

    }

  }
}
