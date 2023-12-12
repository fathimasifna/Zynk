import 'package:dating_app/screens/on_bodyscreen/start_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  _navigateToHome(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const BodyScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    _navigateToHome(context);

    double imageWidth = MediaQuery.of(context).size.width * 1;

    return Scaffold(
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
