import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_shelter_app/views/models/data.dart';
import 'package:easy_shelter_app/views/detailPage.dart';
import 'package:easy_shelter_app/views/models/data_model.dart';
import 'package:flutter/material.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class Card1 extends StatefulWidget {
  const Card1({Key? key}) : super(key: key);

  @override
  State<Card1> createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  CollectionReference allAPartments =
      FirebaseFirestore.instance.collection('Apartments');
  Controller _controller = Controller();
  bool isFavourateActive = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Text(
                      "Discover",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                            shape: StadiumBorder(),
                            color: Colors.teal,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text("Apartments"),
                            )),
                        Text("Hostels"),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                stream: allAPartments.snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text("Something went wrong"));
                  }

                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) => GestureDetector(
                        child: Card(
                          child: Column(
                            children: [
                              // Text(snapshot.data!.docs[index]["description"]),
                              Container(
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      onPressed: () {
                                        print("Add to favaurite");
                                        if(isFavourateActive!=true){
                                            _controller.addtoFavourites(
                                            description: snapshot
                                                .data!.docs[index]["description"],
                                            picture: snapshot.data!.docs[index]
                                                ["pictures"],
                                            price: snapshot.data!.docs[index]
                                                ["price"],
                                            hostelName: snapshot.data!
                                                .docs[index]["hostelName"],
                                            location: snapshot.data!.docs[index]
                                                ["location"],
                                            rooms: snapshot.data!.docs[index]
                                                ["rooms"]);
                                        }
                                       
                                      },
                                      icon: Icon(Icons.favorite_border),
                                      color: Colors.white,
                                    )),
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(snapshot
                                            .data!.docs[index]["pictures"]))),
                              ),

                              Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.home,
                                                color: Colors.black),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  ["hostelName"],
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on,
                                                color: Colors.black),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  ["location"],
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.bedroom_parent_rounded,
                                          color: Colors.black),
                                      Text(
                                        snapshot.data!.docs[index]["rooms"],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.bedroom_parent_rounded,
                                          color: Colors.black),
                                      Text(
                                        snapshot.data!.docs[index]["price"],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => PageDetail(
                                        datatDetails:
                                            snapshot.data!.docs[index],
                                      )));
                        },
                      ),
                    );
                  }

                
                  return Text("loading");
                },
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
