import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weekend_app/constants.dart';
import 'package:flutter_weekend_app/default_screen.dart';
import 'package:flutter_weekend_app/personal.dart';
import 'package:flutter_weekend_app/reservations_screen.dart';
import 'package:flutter_weekend_app/sign_in_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KFUPM Clinic"),
        centerTitle: false,
        actions: [
          TextButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogOut();
              },
              child: Text("Log Out",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                  )))
        ],
        backgroundColor: splashColor,
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: splashColor,
        items: const [
          TabItem(icon: Icon(Icons.book), title: "Reservations"),
          TabItem(icon: Icon(Icons.home), title: "Home"),
          TabItem(icon: Icon(Icons.person), title: "Profile")
        ],
        activeColor: Colors.white,
        initialActiveIndex: index,
        onTap: (index) {
          this.index = index;
          setState(() {});
        },
      ),
      body: IndexedStack(
        index: index,
        // the following screens will be displayed based on the choice made through the bottom navigation bar
        children: [ReservationsScreen(), DefaultScreen(), Profilepage()],
      ),
    );
  }
}
