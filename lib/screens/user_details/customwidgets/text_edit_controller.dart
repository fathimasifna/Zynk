// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

TextField TextCntroller(
  String text,
  IconData icon,
  bool ispasswordType,
  TextEditingController controller,
  TextInputType keyboardType,
) {
  return TextField(
    controller: controller,
    obscureText: ispasswordType,
    enableSuggestions: ispasswordType,
    autocorrect: ispasswordType,
    keyboardType: keyboardType,
    cursorColor: Colors.black,
    style: TextStyle(
      color: Colors.black.withOpacity(0.9),
    ),
    decoration: InputDecoration(
      labelText: text,
      prefixIcon: Icon(icon, color: Colors.black),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
  );
}

