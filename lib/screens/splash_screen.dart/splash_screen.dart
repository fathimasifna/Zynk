import 'package:dating_app/screens/bottomnavigation/bottomnavigation.dart';
import 'package:dating_app/screens/on_bodyscreen/start_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _navigateToDestination() async {
    await Future.delayed(const Duration(seconds: 3));

    final user = FirebaseAuth.instance.currentUser;

    if (context.mounted) {
      if (user != null) {
        Get.offAll(() => BottomNavigation());
      } else {
        Get.offAll(() => const BodyScreen());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _navigateToDestination();
  }

  @override
  Widget build(BuildContext context) {
    double imageWidth = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: imageWidth,
                height: imageWidth,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  ".....",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        offset: Offset(1.5, 1.5),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
