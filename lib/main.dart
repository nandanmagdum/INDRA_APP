import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:version1/features/MainScreen.dart/main_screen.dart';
import 'package:version1/helper/init.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Init(),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
