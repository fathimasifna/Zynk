import 'package:dating_app/screens/Profile/profile_page.dart';
import 'package:dating_app/screens/settings/settings_page.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: Colors.white),
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 1),
            child: Expanded(
                child: Image.asset("assets/images/logo.png", height: 120),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.message,
            color: Theme.of(context).primaryColor,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          },
          icon: Icon(
            Icons.person,
            color: Theme.of(context).primaryColor,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  SettingsPage(),
              ),
            );
          },
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
