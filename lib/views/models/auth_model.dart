import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';

class Authentication {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  /////Sign Up User

  Future createNewUser({String? email, String? password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .whenComplete(() {});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future loginUser({String? email, String? password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!)
          .whenComplete(() {});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

////request a new password from forebase(forgot password)
  Future requestNewPassword(String userRegisteredEmail) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: userRegisteredEmail);
    } on FirebaseAuthException catch (e) {
      print("${e.toString()}");
    }
  }

  //////Add user data to database
  Future<void> addUserToDb(
      {required String firstName, required String lastName, required String email, required String contact}) {
         return users
          .add({
            'firstName': firstName, 
            'lastName': lastName,
            'email': email,
            'contact':contact
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
   
  }
}
