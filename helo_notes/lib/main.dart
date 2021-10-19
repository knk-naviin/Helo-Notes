import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HeloNotes(),
  ));
}

class HeloNotes extends StatefulWidget {
  const HeloNotes({Key? key}) : super(key: key);

  @override
  _HeloNotesState createState() => _HeloNotesState();
}

class _HeloNotesState extends State<HeloNotes> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Text("Language Notes",style: TextStyle(
          fontSize: 50,
          fontFamily: "Bunya",
          color: Colors.deepPurpleAccent
      ),),
      //nextScreen: UserRegistration(),
    );
  }
}
