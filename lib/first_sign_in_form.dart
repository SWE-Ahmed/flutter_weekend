// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weekend_app/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HealthForm extends StatefulWidget {
  const HealthForm({Key key}) : super(key: key);

  @override
  _HealthFormState createState() => _HealthFormState();
}

class _HealthFormState extends State<HealthForm> {
  // initialize the variables
  String hintText;
  TextEditingController allergiesController;
  TextEditingController nameController;
  TextEditingController surnameController;
  TextEditingController ageController;
  TextEditingController medcondController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complete the Personal Form to proceed",
            style: GoogleFonts.montserrat(fontSize: 18)),
        backgroundColor: splashColor,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              FormField(
                  hintText: "Enter your name", nameController: nameController),
              SizedBox(
                height: 40,
              ),
              FormField(
                  hintText: "Enter your surname",
                  nameController: surnameController),
              SizedBox(
                height: 40,
              ),
              FormField(
                  hintText: "Enter your age", nameController: ageController),
              SizedBox(
                height: 40,
              ),
              FormField(
                  hintText: "Enter any allergies you have",
                  nameController: allergiesController),
              SizedBox(
                height: 40,
              ),
              FormField(
                  hintText: "Enter any medical conditions you have",
                  nameController: medcondController),
              SizedBox(
                height: 40,
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      minimumSize: Size(double.infinity, 50)),
                  onPressed: () {
                    final user = FirebaseAuth.instance.currentUser;
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(user.uid)
                        .set({
                      'name': nameController.text,
                      'surname': surnameController.text,
                      'age': ageController.text,
                      'allergies': allergiesController.text,
                      'medical_conditions': medcondController.text
                    });
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.forward,
                    color: Colors.red,
                  ),
                  label: Text(" Submit Personal Form",
                      style: GoogleFonts.montserrat(fontSize: 18)))
            ],
          ),
        ),
      ),
    );
  }
}

class FormField extends StatelessWidget {
  const FormField({
    Key key,
    @required this.hintText,
    @required this.nameController,
  }) : super(key: key);

  final String hintText;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration:
          InputDecoration(hintText: hintText, border: OutlineInputBorder()),
      controller: nameController,
    );
  }
}
