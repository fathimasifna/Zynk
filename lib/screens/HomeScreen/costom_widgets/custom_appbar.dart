import 'package:dating_app/screens/Profile/profile_page.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: true,
      title: Row(
        children: [
          Expanded(
            child: Image.asset("assets/images/logo.png", height: 65),
          ),
          Expanded(
            flex: 3,
            child: Text(
              "hello", 
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            ProfilePage();
          },
          icon: Icon(
            Icons.message,
            color: Theme.of(context).primaryColor,
          ),
        ),
        IconButton(
          onPressed: () {
          },
          icon: Icon(
            Icons.person,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
