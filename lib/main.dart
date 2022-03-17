import 'package:bot_toast/bot_toast.dart';
import 'package:easy_shelter_app/views/auth/fp_screens.dart';
import 'package:easy_shelter_app/views/auth/log%20_in.dart';
import 'package:easy_shelter_app/views/auth/sign_up.dart';
import 'package:easy_shelter_app/views/paymentviews/paymenttype.dart';
import 'package:easy_shelter_app/views/HomePage.dart';                           
import 'package:easy_shelter_app/views/detailPage.dart';
import 'package:easy_shelter_app/views/navbar_screens/profilePage.dart';
import 'package:easy_shelter_app/views/onbording/splash_screen.dart';
import 'package:easy_shelter_app/views/widget/reuserable_botton.dart';
import 'package:firebase_core/firebase_core.dart';  
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

final botToastBuilder = BotToastInit();
void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        EasyLoading.init();
        // child = myBuilder(context,child);  //do something
        child = botToastBuilder(context, child);
        return child;
      },
      navigatorObservers: [BotToastNavigatorObserver()],
      home: SplashScreen()
      // SignUpPage(),
    ),
  );
}
