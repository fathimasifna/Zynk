// userDetailsPage.dart

import 'package:dating_app/screens/user_detailes/controller/use_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailsPage extends StatelessWidget {
  final UserDetailsController controller = Get.put(UserDetailsController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserDetailsPage({Key? key}) : super(key: key);

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
                  controller: controller.fullName,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.9),
                  ),
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    prefixIcon: const Icon(Icons.person),
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
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => controller.selectDate(context),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Date of Birth',
                      prefixIcon: const Icon(Icons.calendar_today),
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
                    child: Obx(() {
                      return controller.selectedDate.value != null
                          ? Text(
                              '${controller.selectedDate.value!.day}/${controller.selectedDate.value!.month}/${controller.selectedDate.value!.year}',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            )
                          : const Text(
                              'Select Date',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            );
                    }),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.qualifications,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.9),
                  ),
                  decoration: InputDecoration(
                    labelText: 'Qualifications',
                    prefixIcon: const Icon(Icons.school),
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
                      return 'Please enter your qualifications';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.job,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.9),
                  ),
                  decoration: InputDecoration(
                    labelText: 'Job',
                    prefixIcon: const Icon(Icons.work),
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
                      return 'Please enter your job';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.hobbies,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.9),
                  ),
                  decoration: InputDecoration(
                    labelText: 'Hobbies',
                    prefixIcon: const Icon(Icons.interests_rounded),
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
                      return 'Please enter your hobbies';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.bio,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.9),
                  ),
                  decoration: InputDecoration(
                    labelText: 'Bio',
                    prefixIcon: const Icon(Icons.interests),
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
                      return 'Please enter your bio';
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
                        fullName: controller.fullName.text,
                        dateOfBirth: controller.selectedDate.value,
                        qualifications: controller.qualifications.text,
                        job: controller.job.text,
                        hobbies: controller.hobbies.text,
                        bio: controller.bio.text,
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
