
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/screens/user_detailes/controller/use_details_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MoreDetails extends StatelessWidget {
  final UserDetailsController controller = Get.put(UserDetailsController());

   MoreDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "More Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 8, right: 8),
          child: FutureBuilder<DocumentSnapshot>(
            future: getUserDetails(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (!snapshot.hasData || snapshot.data == null) {
                return const Text('No data found');
              }

              var userData = snapshot.data!.data() as Map<String, dynamic>;

              return Column(
                children: [
                  TextFormField(
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                    ),
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      prefixIcon: const Icon(Icons.person),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                      ),
                    ),
                    initialValue: userData['fullName'] ?? '',
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                    ),
                    decoration: InputDecoration(
                      labelText: 'Qualifications',
                      prefixIcon: const Icon(Icons.school),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                      ),
                    ),
                    initialValue: userData['qualifications'] ?? '',
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                    ),
                    decoration: InputDecoration(
                      labelText: 'Job',
                      prefixIcon: const Icon(Icons.work),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                      ),
                    ),
                    initialValue: userData['job'] ?? '',
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                    ),
                    decoration: InputDecoration(
                      labelText: 'Hobbies',
                      prefixIcon: const Icon(Icons.interests_rounded),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                      ),
                    ),
                    initialValue: userData['hobbies'] ?? '',
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                    ),
                    decoration: InputDecoration(
                      labelText: 'Bio',
                      prefixIcon: const Icon(Icons.interests),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                      ),
                    ),
                    initialValue: userData['bio'] ?? '',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<DocumentSnapshot> getUserDetails() async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    return await FirebaseFirestore.instance.collection('userdetails').doc(userId).get();
  }
}
