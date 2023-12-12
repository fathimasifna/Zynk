import 'package:dating_app/screens/HomeScreen/home_page.dart';
import 'package:dating_app/screens/user_details/customwidgets/app_bar_controller.dart';
import 'package:dating_app/screens/user_details/customwidgets/custom_container.dart';
import 'package:dating_app/screens/user_details/customwidgets/text_edit_controller.dart';
import 'package:flutter/material.dart';

class Biography extends StatefulWidget {
  const Biography({super.key});

  @override
  State<Biography> createState() => _BiographyState();
}

class _BiographyState extends State<Biography> {
  final TextEditingController _aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const AppBarController(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
               const Padding(
                padding: EdgeInsets.only(right: 250,top: 35,),
                child: Text(
                  "bio",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextCntroller(
                "bio",
                Icons.person,
                false,
                _aboutController,
                TextInputType.name,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 250),
              child: Text(
                "like",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Row(
              children: [
                CustomContainer(text: "music"),
                CustomContainer(text: "music"),
                CustomContainer(text: "music"),
              ],
            ),
            Row(
              children: [
                CustomContainer(text: "music"),
                CustomContainer(text: "music"),
                CustomContainer(text: "music"),
              ],
            ),
            Row(
              children: [
                CustomContainer(text: "music"),
                CustomContainer(text: "music"),
                CustomContainer(text: "mqwertyuioqw"),
              ],
            ),
             Row(
              children: [
                CustomContainer(text: "music"),
                CustomContainer(text: "music"),
                CustomContainer(text: "m"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.withOpacity(0.6),
                elevation: 0,
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
