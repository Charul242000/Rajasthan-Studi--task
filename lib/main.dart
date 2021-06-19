import 'package:flutter/material.dart';

import 'package:rajasthani_studio_task/splash.dart';
//This is the main class
//This heps to run the app

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  SplashScreen()

    );
  }
}

