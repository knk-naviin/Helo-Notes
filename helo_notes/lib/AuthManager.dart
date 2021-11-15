import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


Future<UserCredential?> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
  await googleUser?.authentication;
  if (googleAuth != null) {
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    var userCredentials =
    await FirebaseAuth.instance.signInWithCredential(credential);
    // Once signed in, return the UserCredential
    return userCredentials;
  }
}


Future<void> signout() async {
  (await GoogleSignIn().signOut());
  return FirebaseAuth.instance.signOut();
}


// class Note{
//   final String title;
//   final String id;
//   final String description;
//   final String date;
//   final String uid;
//
//   Note(this.title, this.uid, this.date, this.description, this.id);
//
//   Note.fromDS(String id ,Map<String,dynamic> Data):
//   id=id,
//   title = Data['title'],
//   description = Data['description'],
//   date = Data['date']?.toDate(),
//   uid = Data['uid'];
//
//   Map<String,dynamic> toMap() => {
//     "title" : title,
//     "description" : description,
//     "date" : date,
//     "uid" : uid
//   };
//
// }
//
// class QueryArgs {
//   final String key;
//   final String value;
//
//   QueryArgs(this.value,this.key);
// }
//
// DatabaseService<Note> Notesdb =
