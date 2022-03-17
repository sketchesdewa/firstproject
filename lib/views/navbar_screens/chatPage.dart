

import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  const Card2({ Key? key }) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),color: Colors.black,),
      ),
      
    );
  }
}