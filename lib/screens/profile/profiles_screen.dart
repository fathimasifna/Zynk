import 'package:dating_app/model/model.dart';
import 'package:dating_app/screens/chat/screens/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profiles extends StatelessWidget {
   Profiles({Key? key, required this.user}) : super(key: key);
    final UserModel user;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Padding(
          padding: const EdgeInsets.only(left: 1),
          child: Image.asset("assets/images/logo.png", height: 120),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: Container(
                          width: 170,
                          height: 170,
                          color: Colors.white38,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "More Details",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                IconButton(
                    onPressed: () {
                      Get.to(ChatScreen(user: user));
                    },
                    icon: const Icon(
                      Icons.chat,
                      size: 40,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
