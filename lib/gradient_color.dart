import 'package:flutter/material.dart';
//This class is for gradient background, gradient background make the application looks amazing.
class GradientBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF1b0240),
                Color(0xFF15042e),
                Color(0xFF0d0504)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }
}