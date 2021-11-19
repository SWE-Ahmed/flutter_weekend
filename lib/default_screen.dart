import 'package:flutter/material.dart';

class DefaultScreen extends StatefulWidget {
  const DefaultScreen({Key key}) : super(key: key);

  @override
  _DefaultScreenState createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}
