import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart UP',
      home: AnimatedSplashScreen(
          splash: Image.asset('assets/LOGOcolorSMART.png'),
          duration: 3000,
          splashIconSize: 200,
          splashTransition: SplashTransition.scaleTransition,
          backgroundColor: Colors.white,
          nextScreen: const HomePage()),
    );
  }
}
