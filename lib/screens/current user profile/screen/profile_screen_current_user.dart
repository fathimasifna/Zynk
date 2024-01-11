import 'package:dating_app/screens/favourite/favourite_screen.dart';
import 'package:dating_app/screens/login_page/controller/auth_controller/auth_controller.dart';
import 'package:dating_app/model/model.dart';
import 'package:dating_app/screens/on_bodyscreen/screens/start_page.dart';
import 'package:dating_app/screens/current%20user%20profile/costomwidget/costom_widget.dart';
import 'package:dating_app/screens/current%20user%20profile/screen/more_details_about_user.dart';
import 'package:dating_app/screens/settings/screens/settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      authController.listenToProfileChanges(user.uid);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Center(
                    child: ClipOval(
                      child: Container(
                        width: 140,
                        height: 140,
                        color: Colors.white38,
                        child: _buildProfileImage(),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 55,
                    right: 100,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color.fromARGB(255, 172, 84, 113),
                      ),
                      child: IconButton(
                        onPressed: () => authController.pickImage(),
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  FutureBuilder<UserModel?>(
                    future: authController.getUserInfo(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else if (snapshot.hasData && snapshot.data != null) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 160, left: 135),
                          child: Text(
                            snapshot.data!.username ?? "Default Username",
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white),
                          ),
                        );
                      } else {
                        return const Text("No user data found");
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: GestureDetector(
                  onTap: () {
                    Get.to(MoreDetails());
                  },
                  child: const Row(
                    children: [
                      Text(" More Details",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 20),
              ProfileMenuWidget(
                  title: "Favourite",
                  icon: Icons.favorite,
                  onPress: () {
                    Get.to(() => const FavouriteScreen());
                  },
                  endicon: false,
                  textcolor: Colors.white,
                  startcolor: const Color.fromARGB(255, 132, 13, 52),
                  endcolor: Colors.white),
              const SizedBox(height: 15),
              ProfileMenuWidget(
                title: "Settings",
                icon: Icons.settings,
                onPress: () {
                  Get.to(() => const SettingsScreen());
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

  Widget _buildProfileImage() {
    return FutureBuilder<UserModel?>(
      future: authController.getUserInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.hasData && snapshot.data != null) {
          if (authController.profileImage.value.isNotEmpty) {
            return Image.network(
              authController.profileImage.value,
              fit: BoxFit.cover,
            );
          } else {
            return Container(
              width: 140,
              height: 140,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white38,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.black,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "No Image",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            );
          }
        } else {
          return const Text("No user data found");
        }
      },
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
                //   Navigator.of(context).pop();
                Get.back();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async { 
                await authController.signOut();
                await Get.offAll(() => const BodyScreen());
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
