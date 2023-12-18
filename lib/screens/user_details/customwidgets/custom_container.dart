// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  final String text;

  const CustomContainer({Key? key, required this.text}) : super(key: key);

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 20, left: 15, right: 5),
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.6),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.text,
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.bold),
                ),
                if (isChecked)
                  const Icon(
                    Icons.check,
                    color: Colors.black,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
