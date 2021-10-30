import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AuthManager.dart';


class HomeScreen extends StatelessWidget {
  var photo = FirebaseAuth.instance.currentUser!.photoURL;
  var name = FirebaseAuth.instance.currentUser!.displayName;
  var email = FirebaseAuth.instance.currentUser!.email;
  int _count = 1;


  @override
  Widget build(BuildContext context) {
    // List<Widget> _contatos =
    // new List.generate(_count, (int i) => new ContactRow());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.deepOrange, Colors.red])),
          ),
          title: Text("Helo Note"),
          centerTitle: true,
          actions: [
            PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(photo!),
                        ),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: Text(name!),
                        value: 2,
                      ),
                      PopupMenuItem(

                        child: Text(email!),
                        value: 3,
                      ),
                      PopupMenuItem(
                          child: Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.deepOrange)),
                          onPressed: () {
                            signout().then((value) => {
                                  Navigator.of(context)
                                      .pushReplacementNamed('/userscreen')
                                });
                          },
                          child: Text("Logout"),
                        ),
                      ))
                    ])
          ],
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: FloatingActionButton(
          focusElevation: 0,
          highlightElevation: 0,
          hoverElevation: 0,
          disabledElevation: 0,
          splashColor: Colors.red,
          elevation: 0,
          backgroundColor: Colors.deepOrange,
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => AddNote()),
            // );
          },
          tooltip: "Add folder",
          child: Icon(Icons.add, color: Colors.white),
        ),
        // body: ,
      ),
    );

  }

}