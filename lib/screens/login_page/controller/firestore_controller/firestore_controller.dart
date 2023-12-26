 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/screens/login_page/controller/auth_controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
  final controller = Get.put(AuthController());

void addData() async {
    ("Adding data to Firestore");
    ("Username: ${controller.username.text}");
    ("Email: ${controller.email.text}");

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
        "name": controller.username.text,
        "mail-id": controller.email.text
      }).then((value) {
        ("Data added successfully!");
      }).catchError((error) {
        ("Error adding data: $error");
      });
    } else {
      ("User is not authenticated.");
    }
  }