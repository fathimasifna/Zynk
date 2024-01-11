import 'package:flutter/material.dart';
import 'package:dating_app/model/model.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  final UserModel user;

  const ChatScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.black,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          actions: [
            _buildProfileImage(user),
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    user.username ?? 'No Fullname',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      
    );
  }

  Widget _buildProfileImage(UserModel user) {
    if (user.profileImage != null && user.profileImage!.isNotEmpty) {
      return CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(user.profileImage!),
      );
    } else {
      return CircleAvatar(
        radius: 30,
        backgroundColor: const Color.fromARGB(255, 146, 65, 65),
        child: Icon(
          Icons.person,
          size: 30,
          color: Colors.white,
        ),
      );
    }
  }
}
