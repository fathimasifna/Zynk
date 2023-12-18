
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cntroller/auth_controller.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final controller = Get.put(AuthController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.black45],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.2,
              20,
              0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.username,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                    ),
                    decoration: InputDecoration(
                      labelText: 'Enter User name',
                      prefixIcon: const Icon(Icons.person),
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
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a username';
                      } else if (value.contains(' ')) {
                        return 'Username cannot contain white spaces';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.email,
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
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.password,
                    obscureText: !_isPasswordVisible,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                    ),
                    decoration: InputDecoration(
                      labelText: 'Enter Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        child: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black.withOpacity(0.9),
                        ),
                      ),
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
                      if (value == null || value.length < 6) {
                        return 'Password must be 6 or more characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Obx(()=>
                    Container(
                      height: 55,
                      width: 2000,
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          controller.signUp();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.black26;
                            }
                            return Colors.white;
                          }),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        child:controller.loading.value?const CircularProgressIndicator(color: Colors.black,): const Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
