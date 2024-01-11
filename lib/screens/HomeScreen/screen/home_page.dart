import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/screens/HomeScreen/widget/home_screen_widget_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('homepageuserdetails')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            var userData = snapshot.data?.docs;

            return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(
                userData!.length,
                (index) => HomePageListItems(
                  index: index,
                  about: userData[index]['About'],
                  interest: userData[index]['Interest'],
                  imageUrls: List<String>.from(userData[index]['ImageUrls']),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
