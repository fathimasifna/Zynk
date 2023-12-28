import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/screens/bottomnavigation/bottomnavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailsController extends GetxController {
  TextEditingController fullName = TextEditingController();
  TextEditingController qualifications = TextEditingController();
  TextEditingController job = TextEditingController();
  TextEditingController hobbies = TextEditingController();
  TextEditingController bio = TextEditingController();
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  var loading = false.obs;

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  Future saveUserData({
    required String fullName,
    required DateTime? dateOfBirth,
    required String qualifications,
    required String job,
    required String hobbies,
    required String bio,
  }) async {
    try {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      await FirebaseFirestore.instance.collection('userdetails').doc(userId).set({
        'fullName': fullName,
        'dateOfBirth': dateOfBirth,
        'qualifications': qualifications,
        'job': job,
        'hobbies': hobbies,
        'bio': bio,
      });
    } catch (error) {
      print('Error saving user data: $error');
    }
  }

  Future save() async {
    try {
      loading.value = true;

      Get.to(() => BottomNavigation());
      loading.value = false;
    } catch (e) {
      print('Error in save method: $e');
    } finally {
      loading.value = false;
    }
  }
}