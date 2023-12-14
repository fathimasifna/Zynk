import 'package:dating_app/screens/Profile/controller/title_with_icon.dart';
import 'package:dating_app/screens/user_details/customwidgets/custom_container.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white), 
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 2),
              child: Expanded(
                child: Image.asset("assets/images/logo.png", height: 120),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                "Profile",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /2.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(3, 4),
                        blurRadius: 3,
                        spreadRadius: 3,
                      ),
                    ],
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/profile.png"),
                    ),
                  ),
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Text(
                        "name",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                children: [
                  const TitleWithIcon(text: 'Biography', icon: Icons.edit),
                  const Text("sdfghjkjhgfdfghjkjhgfdfghcuhybxj"),
                  const TitleWithIcon(text: 'Picturs', icon: Icons.edit),
                  SizedBox(
                    height: 125,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: double.infinity,
                          width: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/profile.png"),
                            ),
                          ),
                        );
                      },
                      itemCount: 5,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  const TitleWithIcon(text: 'Location', icon: Icons.edit),
                  const Text("sdfghjkjhgfdfghjkjhgfdfghcuhybxj"),
                  const TitleWithIcon(text: 'Interests', icon: Icons.edit),
                  Column(
                    children: [
                      Row(
                        children: [
                          CustomContainer(text: "Music"),
                          CustomContainer(text: "Travaling"),
                        ],
                      ),
                      
                      Row(
                        children: [
                          CustomContainer(text: "Dancing"),
                          CustomContainer(text: "Swiming"),
                        ],
                      ),
                    ],
                  )
                ],
              ), 
            )
          ],
        ),
      ),
    );
  }
}
