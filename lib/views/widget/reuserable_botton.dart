import 'package:flutter/material.dart';

class ReuserableBotton extends StatelessWidget {
  final String inputText;
  void Function()? onPressed;
  final double height;
  final Icon;
  ReuserableBotton(
      {Key? key,
      required this.inputText,
      required this.height,
      this.onPressed,
      this.Icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: MediaQuery.of(context).size.width / 1.3,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Color(0xff9450e7)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          inputText,
          style: TextStyle(color: Colors.white),
        ),
      ),
      
    );
  }
}

