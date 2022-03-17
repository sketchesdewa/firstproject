

import 'package:easy_shelter_app/views/navbar_screens/profileviews.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Card5 extends StatelessWidget {
  const Card5({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){}, icon: Icon(
            Icons.arrow_back),
          color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              child: CircleAvatar(
                radius: 50,
                child:IconButton(onPressed: (){},
                 icon: Icon(Icons.add_a_photo),
                iconSize: 20,)
              ),
              height: MediaQuery.of(context).size.height/4,
            ),
               Expanded(child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Text("Personal Information",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),),
               SizedBox(width: 120,),
               Align(alignment: Alignment.centerRight,
                 child: IconButton(onPressed: (){
                   Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child:ProfileScreen(),
                    ));
                 },
                  icon: Icon(Icons.perm_identity_outlined),iconSize: 30,)),
              ], ),
                  ),
            Divider(
                 color: Colors.black,
                 height: 50,
                 thickness: 1,
               ),
               Row(
                 children: [
                    Text("Payment Methods",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
              ),),
           SizedBox(width: 150,),
           IconButton(onPressed: (){},
            icon: Icon(Icons.payment)),
            
                 ],
               ),
               Divider(
                 color: Colors.black,
                 height: 30,
                 thickness: 1,
               ),
          
               Padding(
                 padding: const EdgeInsets.all(9.0),
                 child: Row(mainAxisAlignment:
                  MainAxisAlignment.start,
             children: [
                 Text("Get help",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
              ),),
                 SizedBox(width: 230,),
                 IconButton(onPressed: (){},
                  icon: Icon(Icons.question_answer_outlined)),
             ],
           ),
               ),
           Divider(
                 color: Colors.black,
                 height: 50,
                 thickness: 1,
               ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Row(mainAxisAlignment:
               MainAxisAlignment.start,
               children: [
                 Text("Terms of service",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),),
                 SizedBox(width: 160,),
                 IconButton(onPressed: (){}, 
                 icon: Icon(Icons.paste_rounded)),
               ],
           ),
            ),
            Divider(
                 color: Colors.black,
                 height: 50,
                 thickness: 1,
               ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text("Log Out",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),),
                 SizedBox(width: 240,),
                 IconButton(onPressed: (){},
                  icon: Icon(Icons.logout)),
               ],
           ),
            ),
               


               ],))
          

          ],
        ),
      ),
    );
  }
}