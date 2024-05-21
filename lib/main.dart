import 'package:flutter/material.dart';
import 'package:photo_gallery_app_using_rest_api/screens/Home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Photo Gallery App with using Api Calling',
      debugShowCheckedModeBanner: true,
      home: HomeScreen(),
    );
  }
}