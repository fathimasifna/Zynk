import 'package:dating_app/screens/HomeScreen/controller/home_page_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageAddDetails extends StatelessWidget {
  HomePageAddDetails({Key? key}) : super(key: key);
  final HomePageUserDetailsController controller =
      Get.put(HomePageUserDetailsController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 8, right: 8),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.about,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.9),
                  ),
                  decoration: InputDecoration(
                    labelText: 'About',
                    prefixIcon: const Icon(Icons.person_outline_rounded),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your about';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.interest,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.9),
                  ),
                  decoration: InputDecoration(
                    labelText: 'Interest',
                    prefixIcon: const Icon(Icons.interests_outlined),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your interest';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      controller.saveUserData(
                        about: controller.about.text,
                        interest: controller.interest.text,
                      );
                      controller.save();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                  child: const Text(
                    'SAVE',
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
      ),
    );
  }
}
