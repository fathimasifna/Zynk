import 'package:dating_app/screens/chat/screens/user_list_screen.dart';
import 'package:dating_app/screens/profile/screen/profile_screen.dart';
import 'package:dating_app/screens/HomeScreen/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatelessWidget {
  final RxInt currentIndex = 0.obs;

  final List<Widget> _widgetOptions = [
    const HomeScreen(),
    UserListScreen(),
    ProfileScreen(),
  ];

  BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.black],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 1),
                child: Expanded(
                  child: Image.asset("assets/images/logo.png", height: 120),
                ),
              ),
            ],
          ),
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.only(left: 35, top: 17),
          //     child: IconButton(
          //       onPressed: () {
          //         Get.to(const SettingsPage());
          //       },
          //       icon: const Icon(Icons.settings),
          //     ),
          //   ),
          // ],
        ),
        body: Center(
          child: Obx(() => _widgetOptions[currentIndex.value]),
        ),
        bottomNavigationBar: GNav(
          onTabChange: (index) {
            currentIndex.value = index;
          },
          selectedIndex: currentIndex.value,
          tabs: const [
            GButton(
              icon: (Icons.home),
              text: "Home",
              backgroundColor: Colors.white38,
              textStyle: TextStyle(
                color: Colors.white,
              ),
              iconColor: Colors.white,
            ),
            GButton(
              icon: (Icons.chat),
              text: "Chat",
              backgroundColor: Colors.white38,
              textStyle: TextStyle(
                color: Colors.white,
              ),
              iconColor: Colors.white,
            ),
            GButton(
              icon: (Icons.person),
              text: "profile",
              backgroundColor: Colors.white38,
              textStyle: TextStyle(
                color: Colors.white,
              ),
              iconColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
