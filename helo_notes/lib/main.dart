import 'dart:io';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helo_notes/Dashboard.dart';
import 'UserAuthScreen.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var uid = FirebaseAuth.instance.currentUser?.uid;

  runApp(MaterialApp(
    routes: <String, WidgetBuilder>{
      '/dashboard': (BuildContext context) => Dashboard(),
      '/userscreen': (BuildContext context) => UserAuthScreen(),
    },
    debugShowCheckedModeBanner: false,
    home: AnimatedSplashScreen(
      centered: true,
      pageTransitionType: PageTransitionType.fade,
      animationDuration: uid != null
          ? Duration(milliseconds: 200)
          : Duration(milliseconds: 1500),
      duration: uid != null ? 200 : 500,
      splashIconSize: 500,
      splash: Image.asset(
        "images/logobig.jpeg",
        width: 100,
      ),
      nextScreen: LaunchScreen(),
    ),
  ));
}

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    var uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      return UserAuthScreen();
    } else {
      return FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Colors.white70,
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Platform.isAndroid
                    ? CircularProgressIndicator()
                    : CupertinoActivityIndicator(
                        animating: true,
                      ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Loading"),
                )
              ],
            )),
          );
        } else {
          return Dashboard();
        }
      });
    }
  }
}
