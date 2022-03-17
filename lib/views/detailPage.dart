

import 'package:easy_shelter_app/views/paymentviews/paymenttype.dart';
import 'package:easy_shelter_app/views/HomePage.dart';
import 'package:easy_shelter_app/views/widget/reuserable_botton.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PageDetail extends StatelessWidget {
  const PageDetail({Key? key, required this.datatDetails}) : super(key: key);
  final datatDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                duration: Duration(milliseconds: 1),
                type: PageTransitionType.rightToLeft,
                alignment: Alignment.topCenter,
                child: HomePage(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: Column(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(datatDetails["pictures"]))),
          height: MediaQuery.of(context).size.height / 4,
          // color: Colors.blueGrey,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.home, color: Colors.black),
                  Text(datatDetails["hostelName"],
                      style: TextStyle(fontSize: 17)),
                  SizedBox(width: 45),
                  Icon(Icons.payments, color: Colors.black),
                  SizedBox(
                    width: 2,
                  ),
                  Text(datatDetails["price"], style: TextStyle(fontSize: 17)),
                ],
              ),
            ),
            SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.black),
                  Text(datatDetails["location"],
                      style: TextStyle(fontSize: 17)),
                ],
              ),
            ),
            ListTile(
              title: Text("Description",
                  style: Theme.of(context).textTheme.headline6),
              subtitle: Text(datatDetails["description"],
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Contact: 0551221391",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black)),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Email: Easy_shelter@gmail.com",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black)),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ReuserableBotton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: PaymentType(),
                    ));
              },
              inputText: "Check out", height: 44)
           
          ]
        )],
        ),
      );
  
  }
}
