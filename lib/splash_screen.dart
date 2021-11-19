import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weekend_app/constants.dart';
import 'package:flutter_weekend_app/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splashIconSize: 400,
        splash: splash,
        backgroundColor: splashColor,
        nextScreen: const HomeScreen(),
        centered: true,
        splashTransition: SplashTransition.rotationTransition,
        duration: 3000,
      ),
    );
  }
}
