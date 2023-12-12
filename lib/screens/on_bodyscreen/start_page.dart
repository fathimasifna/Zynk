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
    double textFontSize = calculateTextFontSize(context);
    double textPadding = calculateTextPadding(context);

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        pageSnapping: false,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: imageWidth,
              ),
              Text(
                ".....",
                style: TextStyle(fontSize: textFontSize),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: textPadding, vertical: 30),
                child: const Text(
                  "Welcome to ......,Let's Connect",
                ),
              ),
              row(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: imageWidth,
              ),
              Text(
                "....",
                style: TextStyle(
                    fontSize: textFontSize, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: textPadding, vertical: 30),
                child: const Text(
                    "We assist individuals in purchasing rented dresses."),
              ),
              row(),
            ],
          ),
          
        ],
      ),
      bottomNavigationBar: BottomAppBar(
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
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                child: const Text(
                  'Skip >>',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
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
              ? const Icon(Icons.circle,
                  size: 20, color: Colors.red)
              : const Icon(Icons.circle_outlined, size: 10),
        ),
      ),
    );
  }
}
