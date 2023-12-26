import 'dart:io';

import 'package:dating_app/profile/controller/profile_controller.dart';
import 'package:dating_app/screens/login_page/controller/auth_controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController imagecontroller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Center(
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.white38,
                        backgroundImage:
                            imagecontroller.profileImage.value.isNotEmpty
                                ? FileImage(
                                    File(imagecontroller.profileImage.value))
                                : null,
                      ),
                    )),
                IconButton(
                  onPressed: () => imagecontroller.pickImage(),
                  icon: Icon(
                    Icons.image,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              controller: controller.username,
              cursorColor: Colors.black,
              style: TextStyle(
                color: Colors.black.withOpacity(0.9),
              ),
              decoration: InputDecoration(
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.solid),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Bio',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
