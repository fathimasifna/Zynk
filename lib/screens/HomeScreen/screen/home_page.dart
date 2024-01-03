import 'package:dating_app/screens/HomeScreen/widget/home_screen_widget_list_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(
            100,
            (index) => HomePageListItems(
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}
