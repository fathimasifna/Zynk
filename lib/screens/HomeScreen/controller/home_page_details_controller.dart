import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/screens/bottomnavigation/bottomnavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageUserDetailsController extends GetxController {
  TextEditingController about = TextEditingController();
  TextEditingController interest = TextEditingController();
  
  var loading = false.obs;

  
  Future saveUserData({
    required String about,
    required String interest,
   
  }) async {
    try {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      await FirebaseFirestore.instance.collection('homepageuserdetails').doc(userId).set({
        'About': about,
        'Interest': interest,
       
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