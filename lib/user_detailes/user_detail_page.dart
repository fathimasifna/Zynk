import 'dart:io';

import 'package:dating_app/user_detailes/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetailsController extends GetxController {
  RxString photoPath = RxString("");
  RxString dateOfBirthDay = RxString("");
  RxString dateOfBirthMonth = RxString("");
  RxString dateOfBirthYear = RxString("");
  RxString gender = RxString("");
  RxString qualification = RxString("");
  RxString country = RxString("");
  RxString city = RxString("");
  Future<void> saveUserDetailsToFirebase() async {
    try {
      final dob = DateTime(
        int.parse(dateOfBirthYear.value),
        int.parse(dateOfBirthMonth.value),
        int.parse(dateOfBirthDay.value),
      );

      await FirebaseFirestore.instance.collection('users').add({
        'photoPath': photoPath.value,
        'dateOfBirth': dob,
        'gender': gender.value,
        'qualification': qualification.value,
        'country': country.value,
        'city': city.value,
      });
    } catch (e) {
      ('Error saving user details: $e');
    }
  }
}

class UserDetails extends StatelessWidget {
  final UserDetailsController controller = Get.put(UserDetailsController());
  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  ImagePikerController contrler=Get.put(ImagePikerController());

  UserDetails({super.key});

  Future<void> _selectDate(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime initialDate =
        DateTime(now.year - 25); 

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (picked != null) {
      controller.dateOfBirthDay.value = picked.day.toString();
      controller.dateOfBirthMonth.value = picked.month.toString();
      controller.dateOfBirthYear.value = picked.year.toString();

      dayController.text = controller.dateOfBirthDay.value;
      monthController.text = controller.dateOfBirthMonth.value;
      yearController.text = controller.dateOfBirthYear.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                },
                child: Obx(
                  () => CircleAvatar(
                    radius: 50,
                    backgroundImage: contrler.imagepath.isNotEmpty?
                    FileImage(File(contrler.imagepath.toString())):
                    null
                  ),
                ),
                  
              ),
              Positioned(
                  bottom: -0,
                  left: 140,
                  child: IconButton(
                      onPressed: () {
                        showImagePikerOption(context);
                      },
                      icon: const Icon(Icons.add_a_photo))),
              const SizedBox(height: 20),
              const Text('Date of Birth'),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: dayController,
                      onChanged: (value) {
                        controller.dateOfBirthDay.value = value;
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Day'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: monthController,
                      onChanged: (value) {
                        controller.dateOfBirthMonth.value = value;
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Month'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: yearController,
                      onChanged: (value) {
                        controller.dateOfBirthYear.value = value;
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Year'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            Container(
  child: Column(
    children: [
      const Text("Select your gender"),
      ListTile(
        title: const Text("Male"),
        leading: Radio(
          value: "Male",
          groupValue: controller.gender.value,
          onChanged: (String? value) {
            controller.gender.value = value ?? "";
          },
        ),
      ),
      ListTile(
        title: const Text("Female"),
        leading: Radio(
          value: "Female",
          groupValue: controller.gender.value,
          onChanged: (String? value) {
            controller.gender.value = value ?? "";
          },
        ),
      ),
      ListTile(
        title: const Text("Others"),
        leading: Radio(
          value: "Others",
          groupValue: controller.gender.value,
          onChanged: (String? value) {
            controller.gender.value = value ?? "";
          },
        ),
      ),
    ],
  ),
),
              const SizedBox(height: 20),
              const Text('Qualification'),
              TextFormField(
                onChanged: (value) {
                  controller.qualification.value = value;
                },
              ),
              const SizedBox(height: 20),
              const Text('Country'),
              TextFormField(
                onChanged: (value) {
                  controller.country.value = value;
                },
              ),
              const SizedBox(height: 20),
              const Text('City'),
              TextFormField(
                onChanged: (value) {
                  controller.city.value = value;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await controller.saveUserDetailsToFirebase();
                  // Implement navigation or further actions
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void showImagePikerOption(BuildContext context) {
    showBottomSheet(
        backgroundColor: Colors.white38,
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4.5,
              height: MediaQuery.of(context).size.height / 4,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        contrler.imagepath;
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [Icon(Icons.image), Text("Gallery")],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                       // pickImageForCamera();
                        },
                      child: const SizedBox(
                        child: Column(
                          children: [Icon(Icons.camera), Text("Camera")],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
}
}