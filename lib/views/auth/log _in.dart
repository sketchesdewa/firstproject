import 'package:bot_toast/bot_toast.dart';
import 'package:easy_shelter_app/views/HomePage.dart';
import 'package:easy_shelter_app/views/auth/fp_screens.dart';
import 'package:easy_shelter_app/views/auth/sign_up.dart';
import 'package:easy_shelter_app/views/widget/reuserable_botton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../models/auth_model.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  bool value = false;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Authentication _authentication = Authentication();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // bool value = false;
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  height: MediaQuery.of(context).size.height / 1.5,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(90)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            Center(
                              child: Text("Welcome back",
                                  style: TextStyle(
                                      fontSize: 37,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                            ),
                            Center(
                              child: Text("Login to your account",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextFormField(
                                controller: emailController,
                                autofocus: false,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    hintText: 'Email / Username'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                autofocus: false,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    filled: false,
                                    fillColor: Colors.greenAccent,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    hintText: 'Password'),
                              ),
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: value,
                                  onChanged: (values) {
                                    setState(() {
                                      value = !values!;
                                    });
                                  },
                                ),
                                Text("Remenber me"),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 4.4,
                                ),
                                TextButton(
                                    onPressed: () async {
                                      

                                      Navigator.pushReplacement(
                                          context,
                                          PageTransition(
                                            duration: Duration(milliseconds: 1),
                                            type:
                                                PageTransitionType.rightToLeft,
                                            alignment: Alignment.topCenter,
                                            child: ForgotPassword(),
                                          ));
                                    },
                                    child: Text("forgot password?")),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ReuserableBotton(
                                inputText: "Signin",
                                height: 44,
                                onPressed: () async{
                              ///Check if email and password fields are not empty
                                  if (emailController.text.isNotEmpty &&
                                          passwordController.text.isNotEmpty) {
                                        showLoader();
                                        await _authentication.loginUser(
                                            email: emailController.text,
                                            password: passwordController.text);
                                        clossLoasding();
                                        Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: HomePage(),
                                      ));
                                        
                                      }else{
                                         BotToast.showText(
                                        contentColor: Colors.red.shade500,
                                        align: Alignment.topCenter,
                                        text:
                                            "Opps! one or more field is empty");
                                      }
                                  
                                },
                              ),
                            ),
                            Center(
                                child: GestureDetector(
                                    onTap: () async {
                                   

                                      print("Login wass successful");
                                      BotToast.showText(
                                          contentColor: Colors.red.shade500,
                                          align: Alignment.topCenter,
                                          text:
                                              "Privicy policy is not checked!");
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              child: HomePage(),
                                              type: PageTransitionType.fade));
                                    },
                                    child: Text(
                                        "Don't have an account? Create an Account"))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
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

  void setState(Null Function() param0) {}
}
