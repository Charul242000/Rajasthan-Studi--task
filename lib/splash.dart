import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:rajasthani_studio_task/dashboard.dart';

//This is a splash screen or a welcome screen
class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: RichText(
        text: TextSpan(
          text: 'Welcome to my',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 30),
          children: <TextSpan>[
            TextSpan(
                text: 'Assessment',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                    fontSize: 30)),
          ],
        ),
      ),

      // nextScreen: LoginPage(),
      nextScreen: Dashboard(),
      backgroundColor:Colors.black,

    );
  }
}
