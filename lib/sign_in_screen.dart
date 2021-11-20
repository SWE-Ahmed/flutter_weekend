import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weekend_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignInGoogle extends StatelessWidget {
  const SignInGoogle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInPage();
  }
}

// widget definition
class SignInPage extends StatelessWidget {
  const SignInPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // the following container manages the Sign in page for the user
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Image.asset(
                signInLogo,
                height: 200,
                width: 200,
              ),
              SizedBox(height: 40),
              Text("Continue with Google sign up to proceed to Medica",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                  )),
              SizedBox(
                height: 80,
              ),
              // creates the google button
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      minimumSize: Size(double.infinity, 50)),
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.googleLogin();
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  ),
                  label: Text("Continue with Google",
                      style: GoogleFonts.montserrat(fontSize: 18))),
              SizedBox(
                height: 40,
              ),
              Column(
                children: const [
                  Text(
                    "*Continue with Google even if you already have an account ",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// the following class manages the activity of the Google sign in
class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
    clientId:
        "265199761276-ghn4qlv8q3u19qpv259rrq85udpccd7v.apps.googleusercontent.com",
  );

  GoogleSignInAccount userAccount;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn(); // shows up the sign in page
    try {
      if (googleUser == null) return 0; // if the user didnt sign in
      userAccount = googleUser; // if the user signs in

      final googleAuth =
          await userAccount.authentication; // gets the user authentication
      final credentials = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, // get the information from the user
        accessToken: googleAuth.accessToken,
      );

      await FirebaseAuth.instance
          .signInWithCredential(credentials); // sign in using FireBase
      notifyListeners(); // notifies the other widgets for recent activities
    } catch (PlatformException) {
      return SignInPage();
    }
  }

  Future googleLogOut() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
