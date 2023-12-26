// ignore_for_file: use_key_in_widget_constructors

import 'package:dating_app/screens/on_bodyscreen/start_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key});

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          children: [
            Expanded(
              child: Center(
                child: Image.asset("assets/images/logo.png", height: 120),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text(
              "Log out",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white, 
              ),
            ),
            onTap: () {
              _showLogoutConfirmationDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Log Out"),
        content: const Text("Are you sure you want to log out?"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: ()async {
         await     
              Get.offAll(()=> const BodyScreen());
            },
            child: const Text(
              "Log Out",
              style: TextStyle(color: Colors.red), 
            ),
          ),
          
        ],
      );
    },
  );
}
}