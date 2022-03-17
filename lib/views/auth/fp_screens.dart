import 'package:bot_toast/bot_toast.dart';
import 'package:easy_shelter_app/views/auth/log%20_in.dart';
import 'package:easy_shelter_app/views/auth/sign_up.dart';
import 'package:easy_shelter_app/views/models/auth_model.dart';
import 'package:easy_shelter_app/views/widget/reuserable_botton.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  Authentication _authentication = Authentication();
  TextEditingController forgotPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4.4,
              ),
              Expanded(
                child: Container(
                  child: ListView(
                    children: [
                      Center(
                        child: Text("Forgot Password",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                              "Entere the email asociated with your account and we will send you a verification email to restart your password",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          controller: forgotPasswordController,
                          autofocus: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              hintText: 'Email '),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ReuserableBotton(
                          inputText: "Send instraction",
                          height: 44,
                          onPressed: () async {
                            if (forgotPasswordController.text.isNotEmpty) {
                              if (!(forgotPasswordController.text
                                  .contains("@"))) {
                                BotToast.showText(
                                    contentColor: Colors.red.shade500,
                                    align: Alignment.topCenter,
                                    text: "Incorrect email format");
                              } else {
                                showLoader();
                                await _authentication.requestNewPassword(
                                    forgotPasswordController.text);
                                clossLoasding();
                                showMessage(
                                    message:
                                        "We have sent you password recovery instraction to your registed email",
                                    context: context,
                                    callback: ()=> Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                    duration: Duration(milliseconds: 1),
                                    type: PageTransitionType.rightToLeft,
                                    alignment: Alignment.topCenter,
                                    child: LoginPage(),
                                  ),
                                ));

                                // Navigator.pushReplacement(
                                //   context,
                                //   PageTransition(
                                //     duration: Duration(milliseconds: 1),
                                //     type: PageTransitionType.rightToLeft,
                                //     alignment: Alignment.topCenter,
                                //     child: LoginPage(),
                                //   ),
                                // );
                              }
                            } else {
                              BotToast.showText(
                                  contentColor: Colors.red.shade500,
                                  align: Alignment.topCenter,
                                  text: "Opps! Password field can't be empty");
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  height: MediaQuery.of(context).size.height / 1.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    color: Colors.white,
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
}

showMessage({String? message, BuildContext? context,Function()?callback}) {
  return showDialog(
      context: context!,
      builder: (context) => AlertDialog(
            title: Text("Congrats"),
            content: Text(message!),
          )).then((value) {
    Future.delayed(Duration(seconds:1),callback);
  });
}

class ForgotPassword2 extends StatelessWidget {
  const ForgotPassword2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: ListView(
                  children: [
                    Center(
                      child: Text("Check your email",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                            "We have sent you password recovery instraction to your registed email",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ReuserableBotton(
                        inputText: "Open your email App",
                        height: 44,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                              duration: Duration(milliseconds: 1),
                              type: PageTransitionType.rightToLeft,
                              alignment: Alignment.topCenter,
                              child: ForgotPassword3(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.height / 1.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Colors.white,
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
}

class ForgotPassword3 extends StatelessWidget {
  const ForgotPassword3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Expanded(
                  child: ListView(
                    children: [
                      Center(
                        child: Text("Reset password",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                              "Pleace make sure your new password must be different from previous password",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          obscureText: true,
                          autofocus: false,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              filled: false,
                              fillColor: Colors.greenAccent,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              hintText: 'Comfirm '),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          obscureText: true,
                          autofocus: false,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              filled: false,
                              fillColor: Colors.greenAccent,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              hintText: 'Comfirm password'),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ReuserableBotton(
                          inputText: "reset password",
                          height: 44,
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                duration: Duration(milliseconds: 1),
                                type: PageTransitionType.rightToLeft,
                                alignment: Alignment.topCenter,
                                child: ForgotPassword4(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                height: MediaQuery.of(context).size.height / 1.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Colors.white,
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
}

class ForgotPassword4 extends StatelessWidget {
  const ForgotPassword4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: ListView(
                  children: [
                    Center(
                      child: Text("Password reset suuccessfull",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                            "Awosome!! you have successfully updated you password",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ReuserableBotton(
                        inputText: "Go back to login",
                        height: 44,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                              duration: Duration(milliseconds: 1),
                              type: PageTransitionType.rightToLeft,
                              alignment: Alignment.topCenter,
                              child: LoginPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.height / 1.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Colors.white,
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
}
