import 'package:dating_app/screens/splash_screen.dart/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:  Colors.red.withOpacity(0.6),),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
