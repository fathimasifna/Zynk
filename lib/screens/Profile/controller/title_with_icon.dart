import 'package:flutter/material.dart';

class TitleWithIcon extends StatelessWidget {
  final String text;
  final IconData icon;

  const TitleWithIcon({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        IconButton(onPressed: () {}, icon: Icon(icon))
      ],
    );
  }
}
