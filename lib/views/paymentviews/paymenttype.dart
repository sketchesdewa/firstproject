import 'package:circle_bottom_navigation_bar/widgets/tab_item.dart';
import 'package:easy_shelter_app/views/detailPage.dart';
import 'package:easy_shelter_app/views/widget/reuserable_botton.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

class PaymentType extends StatelessWidget {
  const PaymentType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                 Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: PageDetail(datatDetails: null,),
                    ));
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
            ),
            title: Text(
              "Payment methods",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Color.fromARGB(255, 155, 19, 19),
            bottom: TabBar(tabs: [
              Tab(
                text: 'Mobile Money',
              ),
              Tab(
                text: 'Card Payment',
              )
            ]),
          ),
          body: TabBarView(
            children: [MomoPaymentPage(), CardPaymentPage()],
          )),
    );
  }
}

class MomoPaymentPage extends StatefulWidget {
  const MomoPaymentPage({Key? key}) : super(key: key);

  @override
  State<MomoPaymentPage> createState() => _MomoPaymentPageState();
}

class _MomoPaymentPageState extends State<MomoPaymentPage> {
  final item = ['MTN Mobile  money', 'Vodafone cash', 'AirtelTigo'];
  final index = TabItem;
  String? value;

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Payment info",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 44,
              
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12) ,
              border: Border.all(color: Colors.black, width: 3)
              ),
              child: DropdownButton(
                value: value,
                items: item.map(buildMenuItem).toList(),
                onChanged: (value) => setState(() => this.value = value as String?),
                isExpanded: true,
                iconSize: 40,
                
              ),
            ),
          ),

         Padding(
           padding: const EdgeInsets.all(15.0),
           child: TextFormField(
                       autofocus: false,
                      keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      
                    contentPadding: EdgeInsets.symmetric(
                    vertical: 5, horizontal: 10),
                    filled: false,
                    fillColor: Colors.greenAccent,
                    border: OutlineInputBorder(
                   borderRadius:
                   BorderRadius.circular(15)),
                  hintText: 'Momo number'),
                                ),
         ),
        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
             Text('Amount',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Padding(
           padding: const EdgeInsets.all(15.0),
           child: Container(
             height: 70,
             width: 200,
             child: TextFormField(
                     autofocus: false,
                    keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    
                  contentPadding: EdgeInsets.symmetric(
                  vertical: 5, horizontal: 10),
                  filled: false,
                  fillColor: Colors.greenAccent,
                  border: OutlineInputBorder(
                 borderRadius:
                 BorderRadius.circular(15)),
                ),
                              ),
           ),
         )
          ],
        ),
        ReuserableBotton(inputText: 'Pay Now', height: 55,onPressed: (){},)
        ],
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
  
      value: item,
      child: Text(
        item,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );

class CardPaymentPage extends StatelessWidget {
  const CardPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [Padding(
          padding: const EdgeInsets.all(19.0),
          child: Card(
            elevation:300 ,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(image: AssetImage("images/card.png"),
                fit: BoxFit.fill
                ),
                ),
                height: 170,
                width: 500,
                  ),
          ),
        ),
       Expanded(child: ListView(
         children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Card number"),
            ),
        Padding(
           padding: const EdgeInsets.all(15.0),
           child: TextFormField(
                       autofocus: false,
                      keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      
                    contentPadding: EdgeInsets.symmetric(
                    vertical: 5, horizontal: 10),
                    filled: false,
                    fillColor: Colors.greenAccent,
                    border: OutlineInputBorder(
                   borderRadius:
                   BorderRadius.circular(15)),
                  hintText: '***********************'),
                                ),
         ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Card Name"),
          ),
        Padding(
           padding: const EdgeInsets.all(15.0),
           child: TextFormField(
                       autofocus: false,
                      keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      
                    contentPadding: EdgeInsets.symmetric(
                    vertical: 5, horizontal: 10),
                    filled: false,
                    fillColor: Colors.greenAccent,
                    border: OutlineInputBorder(
                   borderRadius:
                   BorderRadius.circular(15)),
                  hintText: 'Shadrack yeboah'),
                                ),
         ),
         Row(
           children: [
             Column(
               children: [
                 Text("Expiry date"),
                 Padding(
           padding: const EdgeInsets.all(15.0),
           child: Container(
             height: 70,
             width: 150,
             child: TextFormField(
                     autofocus: false,
                    keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    
                  contentPadding: EdgeInsets.symmetric(
                  vertical: 5, horizontal: 10),
                  filled: false,
                  fillColor: Colors.greenAccent,
                  border: OutlineInputBorder(
                 borderRadius:
                 BorderRadius.circular(15)),
                 hintText: "3/22"
                ),
                              ),
           ),
         )
               ],
             ),
                Column(
               children: [
                 Text("CVV"),
                 Padding(
           padding: const EdgeInsets.all(15.0),
           child: Container(
             height: 70,
             width: 150,
             child: TextFormField(
                     autofocus: false,
                    keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    
                  contentPadding: EdgeInsets.symmetric(
                  vertical: 5, horizontal: 10),
                  filled: false,
                  fillColor: Colors.greenAccent,
                  border: OutlineInputBorder(
                 borderRadius:
                 BorderRadius.circular(15)),
                 hintText: "233"
                ),
                              ),
           ),
         )
               ],
             ),

           ],
         ),
         Padding(
           padding: const EdgeInsets.all(15.0),
           child: ReuserableBotton(inputText: 'Pay now', height: 55,onPressed: (){},),
         )
         
         ],
       )
       ),

        ],
      ),
    );
  }
}
