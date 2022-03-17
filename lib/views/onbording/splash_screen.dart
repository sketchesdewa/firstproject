// import 'package:easy_shelter_app/views/widget/reuserable_botton.dart';
// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';

// import '../auth/log _in.dart';
// import '../auth/sign_up.dart';

// class SplachScreen extends StatelessWidget {
//   const SplachScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       "Skip?",
//                     ))),
//             SizedBox(
//               height: 150,
//             ),
//             Text(
//               "Search for apartment",
//               style: Theme.of(context).textTheme.headline5,
//             ),
//             Text(
//               "  that suit you",
//               style: Theme.of(context).textTheme.headline5,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height / 40,
//             ),
//             Image.asset(
//               "images/_img.png",
//               height: 300,
//               width: 300,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height / 60,
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     PageTransition(
//                       duration: Duration(milliseconds: 1),
//                       type: PageTransitionType.rightToLeft,
//                       alignment: Alignment.topCenter,
//                       child: SecondSplach2(),
//                     ),
//                   );
//                 },
//                 child: Text("Start"))
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SecondSplach2 extends StatelessWidget {
//   const SecondSplach2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               " Chat and negotiat  ",
//               style: Theme.of(context).textTheme.headline5,
//             ),
//             Text(
//               "with as",
//               style: Theme.of(context).textTheme.headline5,
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height / 40),
//             Image.asset(
//               "images/_img2.png",
//               height: 250,
//               width: 250,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height / 3,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: IconButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                         context,
//                         PageTransition(
//                           duration: Duration(milliseconds: 1),
//                           type: PageTransitionType.rightToLeft,
//                           alignment: Alignment.topCenter,
//                           child: SecondSplach3(),
//                         ),
//                       );
//                     },
//                     icon: Icon(Icons.arrow_forward_ios_rounded),
//                     iconSize: 30,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SecondSplach3 extends StatelessWidget {
//   const SecondSplach3({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               " Chat and negotiate  ",
//               style: Theme.of(context).textTheme.headline5,
//             ),
//             Text(
//               "with us",
//               style: Theme.of(context).textTheme.headline5,
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height / 70),
//             Image.asset(
//               "images/_img3.png",
//               height: 250,
//               width: 250,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height / 25,
//             ),
//             Text(
//               "Set terms and condition",
//               style: Theme.of(context).textTheme.headline5,
//             ),
//             Text(
//               "and finish deal",
//               style: Theme.of(context).textTheme.headline5,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height / 4,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: IconButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                         context,
//                         PageTransition(
//                           duration: Duration(milliseconds: 1),
//                           type: PageTransitionType.rightToLeft,
//                           alignment: Alignment.topCenter,

//                         ),
//                       );
//                     },
//                     icon: Icon(Icons.arrow_forward_ios_rounded),
//                     iconSize: 30,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:easy_shelter_app/views/auth/log%20_in.dart';
import 'package:easy_shelter_app/views/auth/sign_up.dart';
import 'package:easy_shelter_app/views/widget/reuserable_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  getToaster() {
    BotToast.showCustomLoading(
        align: Alignment.bottomCenter,
        toastBuilder: (_) => CircularProgressIndicator());
  }

  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: DecisionPage(), type: PageTransitionType.fade),
            (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("WELLCOME",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("TO",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("EASY SHELTER",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                height: 50,
                color: Colors.green.withOpacity(.5),
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation(Colors.red),
                  ),
                ),
                width: 50,
              )
              //  getToaster()
              // BotToast.showCustomLoading(toastBuilder:(_)=>CircularProgressIndicator())
              // BotToast.showAttachedWidget(attachedBuilder: (_)=>CircularProgressIndicator())
            ],
          ),
        ),
        //  Image.asset("images/img_house.jfif")
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken),
                fit: BoxFit.fill,
                image: AssetImage("images/img_house.jfif"))),
      ),
    );
  }
}

class DecisionPage extends StatelessWidget {
  const DecisionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("The best app for your hostel and apartment rentals",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              ReuserableBotton(
                inputText: "Login",
                height: 44,
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: LoginPage(),
                          type: PageTransitionType.fade));
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReuserableBotton(inputText: "SignUp", height: 44,
                onPressed: (){
                  Navigator.push(
                      context,
                      PageTransition(
                          child: SignUpPage(),
                          type: PageTransitionType.fade));

                },),
              ),
            ],
          ),
        ),
        //  Image.asset("images/img_house.jfif")
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken),
                fit: BoxFit.fill,
                image: AssetImage("images/img_house.jfif"),),),
      ),
    );
  }
}
