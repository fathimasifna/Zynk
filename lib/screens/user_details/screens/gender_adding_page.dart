import 'package:dating_app/screens/user_details/customwidgets/RadioGroup.dart';
import 'package:dating_app/screens/user_details/customwidgets/app_bar_controller.dart';
import 'package:dating_app/screens/user_details/screens/photo_add_page.dart';
import 'package:dating_app/screens/user_details/customwidgets/text_edit_controller.dart';
import 'package:flutter/material.dart';

class GenderAddingPage extends StatefulWidget {
  const GenderAddingPage({Key? key}) : super(key: key);

  @override
  _GenderAddingPageState createState() => _GenderAddingPageState();
}

class _GenderAddingPageState extends State<GenderAddingPage> {
  final TextEditingController _ageController = TextEditingController();

  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const AppBarController(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(screenWidth > 600 ? 32.0 : 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 120,),
                child: Text(
                  "What's your gender",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Colors.white
                  ),
                ),
              ),
              const SizedBox(height: 20),
                        buildRadioGroup("", ["Male", "Female", "Other",]),
      
              const Padding(
                padding: EdgeInsets.only(right: 120),
                child: Text(
                  "How old are you?",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Colors.white
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextCntroller(
                "Enter Age",
                Icons.person,
                false,
                _ageController,
                TextInputType.number,
              
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ImageAddPage(),
                      ),
                    );
                  },
                   style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.withOpacity(0.6),
                  elevation: 0,
                ),
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
   Widget buildRadioGroup(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.1,
            fontWeight: FontWeight.w900,
            color: Colors.white
          ),
        ),
        const SizedBox(height: 10),
        Column(
          children: options
              .map(
                (option) => RadioOption(
                  label: option,
                  value: option.toLowerCase(),
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value.toString();
                    });
                  },
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
