import 'package:bot_toast/bot_toast.dart';
import 'package:easy_shelter_app/views/models/auth_model.dart';
import 'package:easy_shelter_app/views/widget/reuserable_botton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../HomePage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // bool value = false;
  bool value = false;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Authentication _authentication = Authentication();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.darken),
                  fit: BoxFit.fill,
                  image: AssetImage("images/img_house.jfif"))),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Register",
                    style: TextStyle(
                        fontSize: 37,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
              ),
              Text("Create your new account",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white)),
              // SizedBox(height: MediaQuery.of(context).size.height/10,),
              SizedBox(
                height: MediaQuery.of(context).size.height / 45,
              ),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(90)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20, left: 20, right: 20),
                              child: TextFormField(
                                controller: firstNameController,
                                autofocus: false,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    hintText: 'Fisrt Name'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextFormField(
                                controller: lastNameController,
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
                                    hintText: 'Last Name'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextFormField(
                                controller: emailController,
                                autofocus: false,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    hintText: 'Email'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextFormField(
                                controller: contactController,
                                obscureText: true,
                                autofocus: false,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    hintText: 'Contact'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
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
                                    hintText: 'password'),
                              ),
                            ),
                            Center(
                                child: Row(
                              children: [
                                Checkbox(
                                  value: this.value,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.value = value!;
                                    });
                                  },
                                ),
                                Text(
                                    "By signing up you agree to are terms of use and"),
                              ],
                            )),
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Text(
                                "Privecy Policy",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ReuserableBotton(
                                inputText: "Signup",
                                height: 44,
                                onPressed: () async {
                                 
                                  if (emailController.text.isNotEmpty &&
                                      passwordController.text.isNotEmpty &&
                                      lastNameController.text.isNotEmpty &&
                                      firstNameController.text.isNotEmpty) {
                                    showLoader();

                                    await _authentication.createNewUser(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                    await _authentication.addUserToDb(
                                        firstName: firstNameController.text,
                                        lastName: lastNameController.text,
                                        email: emailController.text,
                                        contact: contactController.text);
                                    clossLoasding();
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: HomePage(),
                                            type: PageTransitionType.fade));
                                    BotToast.showText(
                                        contentColor: Colors.red.shade500,
                                        align: Alignment.topCenter,
                                        text: "Welcome ${firstNameController.text}, remember to set your profile picture");
                                  } else if (value == false) {
                                    BotToast.showText(
                                        contentColor: Colors.green.shade500,
                                        align: Alignment.topCenter,
                                        text: "Privicy policy is not checked!");
                                    clossLoasding();
                                  } else {
                                    BotToast.showText(
                                        contentColor: Colors.red.shade500,
                                        align: Alignment.topCenter,
                                        text:
                                            "Opps! one or more field is empty");
                                    clossLoasding();
                                  }
                                },
                              ),
                            ),
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
      ),
    );
  }
}

showLoader() {
  return BotToast.showCustomLoading(
      toastBuilder: (_) => CircularProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ));
  // BotToast.showAttachedWidget(attachedBuilder: (_)=>CircularProgressIndicator())
}

clossLoasding() {
  return BotToast.closeAllLoading();
}
