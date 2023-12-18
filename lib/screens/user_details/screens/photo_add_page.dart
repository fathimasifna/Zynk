import 'package:dating_app/screens/user_details/customwidgets/app_bar_controller.dart';
import 'package:dating_app/screens/user_details/customwidgets/custom_image_widget.dart';
import 'package:dating_app/screens/user_details/screens/about_person_page.dart';
import 'package:flutter/material.dart';

class ImageAddPage extends StatefulWidget {
  const ImageAddPage({super.key});

  @override
  State<ImageAddPage> createState() => _ImageAddPageState();
}

class _ImageAddPageState extends State<ImageAddPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: const AppBarController(),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 220),
              child: Text(
                "add photo",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Colors.white
                ),
              ),
            ),
            SizedBox(
              height: screenWidth * 0.15,
            ),
            SizedBox(height: screenWidth * 0.15),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomImageWidget(),
                      CustomImageWidget(),
                      CustomImageWidget(),
                    ],
                  ),
                  Row(
                    children: [
                      CustomImageWidget(),
                      CustomImageWidget(),
                      CustomImageWidget(),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenWidth * 0.15),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Biography(),
                    ),
                  );
                }
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
