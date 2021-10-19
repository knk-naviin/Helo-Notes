import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:helo_notes/AuthManager.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

Future<void> signout() async {
  (await GoogleSignIn().signOut());
  return FirebaseAuth.instance.signOut();
}

class _SettingScreenState extends State<SettingScreen> {
  var name = FirebaseAuth.instance.currentUser?.displayName;
  var email = FirebaseAuth.instance.currentUser?.email;
  var photourl = FirebaseAuth.instance.currentUser?.photoURL;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: LinearGradient(
              // begin: Alignment.topLeft,
              // end: Alignment.bottomRight,
              colors: <Color>[Colors.deepOrange, Colors.red])),
        ),

        // title: Text("Settings"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(gradient: LinearGradient(
            // begin: Alignment.topLeft,
            // end: Alignment.bottomRight,
            colors: <Color>[Colors.deepOrange, Colors.red])),
        child: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Settings",
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(85)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 700,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(
                            photourl!,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 300,
                          child: IgnorePointer(
                            child: TextFormField(
                              initialValue: name,
                              decoration: InputDecoration(
                                labelText: "Name",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 300,
                          child: IgnorePointer(
                            child: TextFormField(
                              initialValue: email,
                              decoration: InputDecoration(
                                labelText: "Email",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 140,
                          height: 44,
                          child: ElevatedButton.icon(
                            icon: Icon(Icons.logout),
                            label: Text('Log Out'),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Colors.deepOrange,
                              // onPrimary: Colors.white,
                              onSurface: Colors.red,
                            ),
                            onPressed: () {
                              signout().then((value) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          "Alert!",
                                          style: TextStyle(
                                            color:
                                                CupertinoColors.destructiveRed,
                                          ),
                                        ),
                                        content: Text("Are You Sure Log Out"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                "No",
                                                style: TextStyle(
                                                    color: Colors.brown),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pushReplacementNamed(
                                                        '/userscreen');
                                              },
                                              child: Text(
                                                "Yes",
                                                style: TextStyle(
                                                    color: Colors.brown),
                                              )),
                                        ],
                                      );
                                    });
                              });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 110.0),
                        child: Column(
                          children: [

                            Text("Version : 1.0.0",style: TextStyle(
                                color: CupertinoColors.systemGrey,
                                fontWeight: FontWeight.bold
                            ),),
                            Text("This App is Copyright © 2021 Yash School of technology",style: TextStyle(
                                color: CupertinoColors.systemGrey,
                              fontSize: 12
                            ),),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
