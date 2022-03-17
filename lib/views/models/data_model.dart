import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
User currentUser = _firebaseAuth.currentUser!;

class Controller {
  CollectionReference users = FirebaseFirestore.instance
      .collection('Fourites')
      .doc(currentUser.uid)
      .collection("myfavourates");

  addtoFavourites(
      {required String description,
      required String picture,
      required String price,
      required String hostelName,
      required String location,
      required String rooms}) async {
    return users.add({
      'hostelName': hostelName,
     'description':description,
     'picture':picture,
     'price':price,
     'location':location,
     'rooms':rooms
    });
  }
}
