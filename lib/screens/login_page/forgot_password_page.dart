import 'package:dating_app/cntroller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Forgot Password',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.black45],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.restemail,
                cursorColor: Colors.black,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.9),
                ),
                decoration: InputDecoration(
                  labelText: 'Enter Email-id',
                  prefixIcon: const Icon(Icons.mail),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        const BorderSide(width: 0, style: BorderStyle.none),
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      !RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                          .hasMatch(value)) {
                    print('Please enter a valid email address');
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              Obx(()=>
                 ElevatedButton(
                   onPressed: () {
                     controller.restPassword();
                   },
                   child: controller.loading.value?const CircularProgressIndicator(color: Colors.black,): const Text(
                     'Reset Password',
                     style: TextStyle(color: Colors.black),
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
