import 'package:flutter/material.dart';

class AppBarController extends StatelessWidget implements PreferredSizeWidget {
  const AppBarController({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white), 
        title: Row(
          children: [
            Center(
              child: Expanded(
                child: Image.asset("assets/images/logo.png", height: 120),
              ),
            ),
          
          ],
        ),
      
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
