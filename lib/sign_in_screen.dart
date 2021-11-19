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

class SignInPage extends StatelessWidget {
  const SignInPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: const Text("KFUPM Clinic"),
        backgroundColor: splashColor,
      ),*/
      // the following container manages the Sign in page for the user
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40,
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
                  label: Text("Sign up with Google")),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text("Already have an account? "),
                  TextButton(onPressed: () {}, child: Text("Sign in"))
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
}
