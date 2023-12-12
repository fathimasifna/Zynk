import 'package:flutter/material.dart';

class AppBarController extends StatelessWidget implements PreferredSizeWidget {
  const AppBarController({
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
     
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
