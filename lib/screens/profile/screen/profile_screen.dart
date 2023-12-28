import 'dart:io';

import 'package:dating_app/screens/on_bodyscreen/screens/start_page.dart';
import 'package:dating_app/screens/profile/controller/profile_controller.dart';
import 'package:dating_app/screens/profile/costomwidget/costom_widget.dart';
import 'package:dating_app/screens/profile/screen/more_details_about_user.dart';
import 'package:dating_app/screens/login_page/controller/auth_controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController imagecontroller = Get.put(ProfileController());
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Obx(() => Stack(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.white38,
                          backgroundImage:
                              imagecontroller.profileImage.value.isNotEmpty
                                  ? FileImage(
                                      File(imagecontroller.profileImage.value))
                                  : null,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 90,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white),
                          child: IconButton(
                            onPressed: () => imagecontroller.pickImage(),
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              const SizedBox(height: 16),
              const Text(
                "data",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
             
              // ElevatedButton(
              //     onPressed: () {
              //       Get.to(AddMoreDetails());
              //     },
              //     child: Text(" Add More Details")),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: GestureDetector(
                  child: Row(
                    children: [
                      const Text(" More details",style:TextStyle(color: Colors.white) ,),
                      IconButton(
                          onPressed: () {
                            Get.to(AddMoreDetails());
                          },
                          icon: const Icon(Icons.edit,color: Colors.white,)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 20),
              ProfileMenuWidget(
                title: "Settings",
                icon: Icons.settings,
                onPress: () {
                //  Get.to();
                },
                endicon: false,
                textcolor: Colors.white,
                startcolor: Colors.blue,
                endcolor: Colors.white,
              ),
              const SizedBox(height: 15),
              ProfileMenuWidget(
                title: "Log Out",
                icon: Icons.logout_outlined,
                onPress: () {
                  _showLogoutConfirmationDialog(context);
                },
                endicon: false,
                textcolor: Colors.white,
                startcolor: Colors.red,
                endcolor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Log Out"),
          content: const Text("Are you sure you want to log out?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                await Get.offAll(() =>  const BodyScreen());
              },
              child: const Text(
                "Log Out",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
