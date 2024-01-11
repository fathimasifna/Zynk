import 'package:dating_app/screens/settings/costom_widget/costom_widget.dart';
import 'package:dating_app/screens/settings/screens/Privacy_Policy_screen.dart';
import 'package:dating_app/screens/settings/screens/about_us_sccreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 27),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              HomePageMenuWidget(
                title: 'Privacy Policy',
                icon: Icons.privacy_tip_outlined,
                textcolor: Colors.white,
                startcolor: Colors.green,
                onPress: () {
                  Get.to(() => const PrivacyPolicy());
                },
                endicon: false,
                endcolor: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              HomePageMenuWidget(
                  title: 'Share App',
                  icon: Icons.share,
                  onPress: () {},
                  endicon: false,
                  textcolor: Colors.white,
                  startcolor: Colors.yellow,
                  endcolor: Colors.black26),
              const SizedBox(
                height: 20,
              ),
              HomePageMenuWidget(
                  title: 'About Us',
                  icon: Icons.info_outline,
                  onPress: () {
                    Get.to(() => const AboutScreen());
                  },
                  endicon: false,
                  textcolor: Colors.white,
                  startcolor: const Color.fromARGB(255, 166, 12, 193),
                  endcolor: Colors.black26),
             
            ],
          ),
        ),
      ),
    );
  }
}
