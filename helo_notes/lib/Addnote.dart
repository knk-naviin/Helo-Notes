import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

TextEditingController content = TextEditingController();

CollectionReference notesref = FirebaseFirestore.instance.collection("notes");

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.deepOrange, Colors.red])),
          ),
          title: Text("Add Note"),
          centerTitle: true,
          actions: [
            CupertinoButton(
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  notesref.add({"notes": content.text}).whenComplete(
                      () => Navigator.of(context).pop());
                })
          ],
        ),
        floatingActionButton: FloatingActionButton(
          focusElevation: 0,
          highlightElevation: 0,
          hoverElevation: 0,
          disabledElevation: 0,
          splashColor: Colors.red,
          elevation: 0,
          backgroundColor: Colors.deepOrange,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddNote()),
            );
          },
          tooltip: "Add folder",
          child: Icon(Icons.add, color: Colors.white),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 8, bottom: 8),
              child: TextFormField(
                controller: content,
              ),
            )
          ],
        ),
      ),
    );
  }
}
