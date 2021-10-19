import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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

CollectionReference userRef = FirebaseFirestore.instance.collection("user");

Future<void> addUserToFirestore() async {
  var uid = FirebaseAuth.instance.currentUser?.uid;
  var name = FirebaseAuth.instance.currentUser?.displayName;
  var email = FirebaseAuth.instance.currentUser?.email;
  var photourl = FirebaseAuth.instance.currentUser?.photoURL;
  userRef.doc().set({
    "uid" : uid,
    "name" : name,
    "email" : email,
    "photo_url" : photourl

  }

  );
}