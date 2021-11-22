// ignore_for_file: prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weekend_app/constants.dart';
import 'package:flutter_weekend_app/first_sign_in_form.dart';
import 'package:flutter_weekend_app/home_screen.dart';
import 'package:flutter_weekend_app/personal.dart';
import 'package:flutter_weekend_app/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final bool _haveAccount = false;

  final user = FirebaseAuth.instance.currentUser;

  Widget checkEmail() {
    CollectionReference collection =
        FirebaseFirestore.instance.collection("users");

    return FutureBuilder<DocumentSnapshot>(
      future: collection.doc(user.uid).get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data.data() as Map<String, dynamic>;
          return Text("${data['email']}");
        }
        return Text("Loading");
      },
    );
  }

  Widget nextScreen() {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // user is still in sigining in process
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
              // user is signed in successfully
            } else if (snapshot.hasData) {
              // if the user already has an account
              checkEmail();
              if (_haveAccount) {
                return HomeScreen();
                // the user's unique id will be used as the name of the document in firebase
              } else {
                CollectionReference usersInfo =
                    FirebaseFirestore.instance.collection('users');
                usersInfo.doc(user.displayName).set({'email': user.email});
                // adds the user's email to the firebase firestore
                return HomeScreen();
              }
            } else if (snapshot.hasError) {
              return Center(child: Text("Something went wrong"));
            } else {
              return SignInGoogle();
            }
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splashIconSize: 400,
        splash: splash,
        backgroundColor: splashColor,
        nextScreen: nextScreen(),
        centered: true,
        splashTransition: SplashTransition.rotationTransition,
        duration: 3000,
      ),
    );
  }
}

/* class AccountCheck extends StatelessWidget {
  const AccountCheck({
    Key key,
    @required bool haveAccount,
    @required this.user,
  })  : _haveAccount = haveAccount,
        super(key: key);

  final bool _haveAccount;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // user is still in sigining in process
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
              // user is signed in successfully
            } else if (snapshot.hasData) {
              // if the user already has an account
              if (_haveAccount) {
                return HomeScreen();
                // the user's unique id will be used as the name of the document in firebase
              } else {
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(user.uid)
                    .set({'email': user.email});
                // adds the user's email to the firebase firestore
                return HomeScreen();
              }
            } else if (snapshot.hasError) {
              return Center(child: Text("Something went wrong"));
            } else {
              return SignInGoogle();
            }
          }),
    );
  }
} */
