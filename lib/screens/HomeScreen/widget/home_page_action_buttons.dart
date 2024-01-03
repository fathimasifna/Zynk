import 'package:flutter/material.dart';

class HomePageActionButtons extends StatelessWidget {
  final IconButton iconButton;

  const HomePageActionButtons({Key? key, required this.iconButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconButton,
          
        ],
      ),
    );
  }
}
