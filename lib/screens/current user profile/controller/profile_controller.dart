// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfileController extends GetxController {
//   var profileImage = ''.obs;

//   Future<void> pickImage() async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       profileImage.value = pickedFile.path;
//       await _uploadImageToFirebaseStorage(profileImage.value);
//     }
//   }

//   Future<void> _uploadImageToFirebaseStorage(String filePath) async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       final String uid = user?.uid ?? '';
//       String fileName = 'profile_image_$uid.jpg';
//       Reference storageReference =
//           FirebaseStorage.instance.ref().child('profile_images/$fileName');
//       UploadTask uploadTask = storageReference.putFile(File(filePath));
//       await uploadTask.whenComplete(() => null);

//       String imageUrl = await storageReference.getDownloadURL();

//       await FirebaseFirestore.instance.collection('users').doc(uid).update({
//         'profileImage': imageUrl,
//       });
//     } catch (e) {
//       ('Error uploading image to Firestore: $e');
//     }
//   }

//   void listenToProfileChanges(String uid) {
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(uid)
//         .snapshots()
//         .listen((snapshot) {
//       if (snapshot.exists) {
//         final data = snapshot.data();
//         if (data != null && data.containsKey('profileImage')) {
//           profileImage.value = data['profileImage'];
//         }
//       }
//     });
//   }
// }
