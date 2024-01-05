import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/screens/bottomnavigation/bottomnavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomePageUserDetailsController extends GetxController {
  TextEditingController about = TextEditingController();
  TextEditingController interest = TextEditingController();
  Rx<File> image1 = File('').obs;
  Rx<File> image2 = File('').obs;
  var loading = false.obs;

  Future<String> uploadImageToStorage(File image) async {
    try {
      Reference storageReference =
          FirebaseStorage.instance.ref().child('user_images/${DateTime.now().millisecondsSinceEpoch}');
      UploadTask uploadTask = storageReference.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      ('Error uploading image: $e');
      throw Exception('Error uploading image');
    }
  }

  Future saveUserData({
    required String about,
    required String interest,
  }) async {
    try {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      List<String> imageUrls = [];

      if (image1.value.path.isNotEmpty) {
        String imageUrl1 = await uploadImageToStorage(image1.value);
        imageUrls.add(imageUrl1);
      }

      if (image2.value.path.isNotEmpty) {
        String imageUrl2 = await uploadImageToStorage(image2.value);
        imageUrls.add(imageUrl2);
      }

      await FirebaseFirestore.instance
          .collection('homepageuserdetails')
          .doc(userId)
          .set({
        'About': about,
        'Interest': interest,
        'ImageUrls': imageUrls,
      });
    } catch (error) {
      ('Error saving user data: $error');
    }
  }

  Future save() async {
    try {
      loading.value = true;
      Get.to(() => BottomNavigation());
    } catch (e) {
      ('Error in save method: $e');
    } finally {
      loading.value = false;
    }
  }

  Future imagePicker(int imageNumber) async {
    try {
      final imagePick = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imagePick == null) {
        return;
      }
      final imageTemp = File(imagePick.path);

      if (imageNumber == 1) {
        image1.value = imageTemp;
      } else if (imageNumber == 2) {
        image2.value = imageTemp;
      }
    } catch (e) {
      ('Error selecting image: $e');
    }
  }
}
