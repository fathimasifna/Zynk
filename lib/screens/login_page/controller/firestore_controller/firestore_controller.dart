import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/screens/login_page/controller/auth_controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

final controller = Get.put(AuthController());

void addData() async {
  print("Adding data to Firestore");
  print("Username: ${controller.username.text}");
  print("Email: ${controller.email.text}");

  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    try {
      await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
        "name": controller.username.text,
        "mail-id": controller.email.text,
      });
      print("Data added successfully!");
    } catch (error) {
      print("Error adding data: $error");
    }
  } else {
    print("User is not authenticated.");
  }
}
