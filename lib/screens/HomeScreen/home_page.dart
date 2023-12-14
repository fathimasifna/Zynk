import 'package:dating_app/screens/HomeScreen/costom_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.black,
        appBar: CustomAppBar(),
        body: Text(
          "rtyui",
          style: TextStyle(color: Colors.amber),
        ));
  }
}
