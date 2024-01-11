import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/model/model.dart';
import 'package:dating_app/screens/chat/screens/chat_page.dart';
import 'package:dating_app/screens/login_page/controller/auth_controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class UserListScreen extends StatefulWidget {
  UserListScreen({Key? key}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
  final controller = Get.put(AuthController());
}

class _UserListScreenState extends State<UserListScreen> {
  final TextEditingController searchController = TextEditingController();
  final _searchSubject = BehaviorSubject<String>.seeded('');

  @override
  void dispose() {
    _searchSubject.close();
    searchController.dispose();
    super.dispose();
  }

  void performSearch() {
    print("Performing search: ${searchController.text}");
    _searchSubject.add(searchController.text.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            color: Colors.black,
            child: TextField(
              onChanged: (value) {
                performSearch();
              },
              style: const TextStyle(color: Colors.white),
              controller: searchController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15,
                ),
                hintText: "Search",
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(),
                ),
                hintStyle: const TextStyle(
                  color: Colors.white54,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: StreamBuilder(
              stream: _searchSubject
                  .distinct()
                  .debounceTime(const Duration(milliseconds: 300))
                  .switchMap((searchText) {
                    if (searchText.isEmpty) {
                      return FirebaseFirestore.instance
                          .collection("users")
                          .snapshots();
                    } else {
                      return FirebaseFirestore.instance
                          .collection("users")
                          .orderBy("fullname")
                          .startAt([searchText.toLowerCase()])
                          .endAt([searchText.toLowerCase() + 'z'])
                          .snapshots();
                    }
                  }),
              builder: (context, snapshot) {
                print("Snapshot: $snapshot");
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text("An error occurred: ${snapshot.error}");
                } else if (snapshot.data is QuerySnapshot) {
                  QuerySnapshot dataSnapshot = snapshot.data as QuerySnapshot;
                  List<UserModel> users = dataSnapshot.docs
                      .map((doc) => UserModel.fromMap(
                          doc.data() as Map<String, dynamic>))
                      .toList();

                  if (users.isNotEmpty) {
                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        UserModel user = users[index];
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(ChatScreen(user: user));
                              },
                              child: ListTile(
                                leading: _buildProfileImage(user),
                                title: Text(
                                  user.username ?? 'No Fullname',
                                  style: TextStyle(color: Colors.white),
                                ),
                                trailing: Text("0:00"),
                              ),
                            ),
                            Divider(color: Color.fromARGB(255, 62, 33, 33)),
                          ],
                        );
                      },
                    );
                  } else {
                    return const Text(
                      "No results found!",
                      style: TextStyle(color: Colors.white),
                    );
                  }
                } else {
                  return const Text(
                    "No results found!",
                    style: TextStyle(color: Colors.white),
                  );
                }
              },
            ),
          ),
        ],
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
