import 'dart:collection';

import 'package:flutter/material.dart';

var name = 'Abdullah Al-faraj';
var nameVar = '  ' + name + '  ';
var bloodTypeVar = 'A+';
int ageVar = 30;
int idVar = 201587970;
var med1 = 'Gentamicin';
var med2 = 'Penicillin';
var med3 = 'Tedizolid';
int no1 = 3;
int no2 = 3;
int no3 = 3;
var dose1 = no1.toString() + '/Day';
var dose2 = no1.toString() + '/Day';
var dose3 = no1.toString() + '/Day';
var ill1 = 'High Blood Pressure';
var ill2 = 'Chickenpox';

class Profilepage extends StatefulWidget {
  @override
  _ProfilepageState createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://googleflutter.com/sample_image.jpg'),
                      fit: BoxFit.fill),
                )),
          ),
          SizedBox(
            height: 8,
          ),
          Center(
              child: Flexible(
            child: Container(
                height: 42.0,
                width: 200.0,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(8.10))),
                child: FittedBox(fit: BoxFit.contain, child: Text(nameVar))),
          ) //
              ),
          SizedBox(
            height: 29,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Flexible(
                  child: Container(
                      height: 25.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.10))),
                      child: Text(
                        ' Personal Information',
                        style: TextStyle(fontSize: 20),
                      )))),
          SizedBox(height: 15),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                      height: 25.0,
                      width: 100.0,
                      child: Text(
                        'Blood Type',
                        style: TextStyle(fontSize: 20),
                      ))),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(bloodTypeVar, style: TextStyle(fontSize: 20)),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                    height: 25.0,
                    width: 80.0,
                    child: Text(
                      'Age',
                      style: TextStyle(fontSize: 20),
                    ))),
            Spacer(),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  ageVar.toString(),
                  style: TextStyle(fontSize: 20),
                ))
          ]),
          SizedBox(
            height: 5,
          ),
          Row(children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                    height: 25.0,
                    width: 80.0,
                    child: Text(
                      'ID Number ',
                      style: TextStyle(fontSize: 20),
                    ))),
            Spacer(),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  idVar.toString(),
                  style: TextStyle(fontSize: 20),
                ))
          ]),
          SizedBox(
            height: 15,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Flexible(
                  child: Container(
                      height: 25.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.10))),
                      child: Text(
                        ' Medical Prescriptions',
                        style: TextStyle(fontSize: 20),
                      )))),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                      height: 25.0,
                      width: 100.0,
                      child: Text(
                        med1,
                        style: TextStyle(fontSize: 20),
                      ))),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(dose1, style: TextStyle(fontSize: 20)),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                    height: 25.0,
                    width: 80.0,
                    child: Text(
                      med2,
                      style: TextStyle(fontSize: 20),
                    ))),
            Spacer(),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  dose2,
                  style: TextStyle(fontSize: 20),
                ))
          ]),
          SizedBox(
            height: 5,
          ),
          Row(children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                    height: 25.0,
                    width: 80.0,
                    child: Text(
                      med3,
                      style: TextStyle(fontSize: 20),
                    ))),
            Spacer(),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  dose3,
                  style: TextStyle(fontSize: 20),
                ))
          ]),
          SizedBox(
            height: 15,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Flexible(
                  child: Container(
                      height: 25.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.10))),
                      child: Text(
                        ' Known Ilnesses',
                        style: TextStyle(fontSize: 20),
                      )))),
          SizedBox(
            height: 15,
          ),

          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                ill1,
                style: TextStyle(fontSize: 20),
              )),
          SizedBox(
            height: 5,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                ill2,
                style: TextStyle(fontSize: 20),
              ))

          //
        ],
      ),
    ));
  }
}
