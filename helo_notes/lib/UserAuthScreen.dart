import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'AuthManager.dart';

class UserAuthScreen extends StatefulWidget {
  const UserAuthScreen({Key? key}) : super(key: key);

  @override
  _UserAuthScreenState createState() => _UserAuthScreenState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class _UserAuthScreenState extends State<UserAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Image.asset("images/helonotes.jpeg", width: 250),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Center(
                child: Column(
              children: [
                Text(
                  "Login Here",
                  style: TextStyle(
                    fontSize: 20, color: CupertinoColors.secondaryLabel,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.redAccent),
                              elevation: MaterialStateProperty.all(0)),
                          onPressed: () {
                            signInWithGoogle().then((value) {
                              addUserToFirestore().then((value) => {
                              Navigator.of(context)
                                  .pushReplacementNamed("/dashboard")
                              });
                            }).catchError((onError) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                        title: Text(onError.toString()));
                                  });
                            });
                            print("Sign in google");
                          },
                          child: Text("Sign in with Google"))),
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}

