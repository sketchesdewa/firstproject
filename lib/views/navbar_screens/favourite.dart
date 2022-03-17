import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

User currentUser = _firebaseAuth.currentUser!;

class Card4 extends StatelessWidget {
  Card4({Key? key}) : super(key: key);
  final _usersStream = FirebaseFirestore.instance
      .collection('Fourites')
      .doc(currentUser.uid)
      .collection('myfavourates')
      .get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: _usersStream.asStream(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
              itemBuilder: (context, index) => FavourateCard(
                imageUrl:snapshot.data!.docs[index]["picture"] ,
              ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 5,
                  ),
              itemCount: snapshot.data!.docs.length);
          // return Text(snapshot.data!.docs[0]["description"]);
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Text("Hello");
      },
    ));
  }
}

////Favourate Card Widget

class FavourateCard extends StatelessWidget {
   FavourateCard({Key? key ,this.imageUrl}) : super(key: key);

  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 120,
      // color: Colors.red,
      child: Row(
        children: [
          imageCard(imageUrl: imageUrl),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("HostelName"),
              Text("Number of rooms"),
            ],
          )
        ],
      ),
    );
  }
}

imageCard({String? imageUrl}) {
  return Container(
    height: 120,
    width: 120,
    decoration: BoxDecoration(
        color: Colors.blue, image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl!))),
  );
}
