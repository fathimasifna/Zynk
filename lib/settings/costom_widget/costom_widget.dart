import 'package:flutter/material.dart';

class HomePageMenuWidget extends StatelessWidget {
  const HomePageMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    required this.endicon,
    required this.textcolor,
    required this.startcolor,
    required this.endcolor,
  }) : super(key: key);
final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endicon;
  final Color textcolor;
  final Color startcolor;
  final Color endcolor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        decoration: BoxDecoration(
          color: startcolor,
          borderRadius: BorderRadius.circular(100),
        ),
        width: 40,
        height: 40,
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: textcolor,fontSize: 18,fontWeight: FontWeight.bold),
      ),
      trailing: endicon
          ? Container(
              decoration: BoxDecoration(
                color: endcolor,
                borderRadius: BorderRadius.circular(100),
              ),
              width: 40,
              height: 40,
              child: const Icon(
                Icons.share,
                color: Colors.black,
              ),
            )
          : null,
    );
  }
}
