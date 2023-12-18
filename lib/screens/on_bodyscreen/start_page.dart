// ... (your imports and other code)

import 'package:dating_app/screens/login_page/signin_page.dart';
import 'package:flutter/material.dart';

class BodyScreen extends StatefulWidget {
  const BodyScreen({Key? key}) : super(key: key);

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  int currentPage = 0;

  double calculateImageWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * 0.50;
  }

  double calculateTextFontSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * 0.2;
  }

  double calculateTextPadding(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * 0.1;
  }

  @override
  Widget build(BuildContext context) {
    double imageWidth = calculateImageWidth(context);
    double textPadding = calculateTextPadding(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        scrollDirection: Axis.horizontal,
        pageSnapping: false,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        children: [
          // Page 1
          Container(
            color: Colors.black, 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: imageWidth,
                ),
                const Text(
                  ".....",
                  style: TextStyle(color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: textPadding, vertical: 30),
                  child: const Text(
                    "Welcome to Zynk,Let's Connect",
                    style: TextStyle(color: Colors.white,fontSize: 19),
                  ),
                ),
                row(),
              ],
            ),
          ),
          // Page 2
          Container(
            color: Colors.black, 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: imageWidth,
                ),
                const Text(
                  "....",
                  style: TextStyle(color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: textPadding, vertical: 30),
                  child: const Text(
                    "Meet and enjoy yourselves with pleasure,🥰🥰",
                    style: TextStyle(color: Colors.white,fontSize: 19),
                  ),
                ),
                row(),
              ],
            ),
          ),
        ],
      ),
     bottomNavigationBar: BottomAppBar(
  color: Colors.black,  
  child: SizedBox(
    height: 50.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignIn()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black12,
            elevation: 0,
          ),
          child: const Text(
            'Skip >>',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 214, 53, 107),
            ),
          ),
        ),
      ],
    ),
  ),
),

    );
  }

  Widget row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        2,
        (index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: currentPage == index
              ? const Icon(Icons.circle, size: 20, color:Color.fromARGB(255, 241, 53, 115),)
              : const Icon(Icons.circle_outlined, size: 16, color: Colors.white),
        ),
      ),
    );
  }
}
