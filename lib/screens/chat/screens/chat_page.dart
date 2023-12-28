// chat_controller.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/screens/login_page/controller/auth_controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final RxList<String> messages = <String>[].obs;

  void sendMessage(String message) {
    // Implement sending messages to Firestore
  }

  void getMessages(String userId) {
    // Implement fetching messages from Firestore based on the selected user
  }
}

class UsersController extends GetxController {
  final RxList<String> users = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch the list of users from Firestore
    getUsers();
  }

  Future<void> getUsers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      users.value = querySnapshot.docs.map((doc) => doc.id).toList();
    } catch (error) {
      print('Error fetching users: $error');
    }
  }
}


class UserListScreen extends StatelessWidget {
  final UsersController usersController = Get.put(UsersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
       
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: usersController.users.length,
          itemBuilder: (context, index) {
            final userId = usersController.users[index];
            return ListTile(
              title: Text(userId),
              onTap: () {
                Get.to(() => ChatScreen(userId: userId));
              },
            );
          },
        ),
      ),
    );
  }
}
// chat_screen.dart


class ChatScreen extends StatelessWidget {
  final String userId;
  final ChatController chatController = Get.put(ChatController());

  ChatScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with $userId'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(chatController.messages[index]),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onSubmitted: (message) {
                      chatController.sendMessage(message);
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Implement sending message
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

