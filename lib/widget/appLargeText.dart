import 'package:flutter/material.dart';

class AppLargeApp extends StatelessWidget {
  double size;
  final String text;
  final Color color;

   AppLargeApp({Key? key,
     required this.text,
     this.color = Colors.black,  this.size=30.0,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: TextStyle(fontSize: size,color: color,fontWeight: FontWeight.bold),
    );
  }
}
