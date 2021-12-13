import 'package:diccoverapp/misc/colors.dart';
import 'package:diccoverapp/widget/appText.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  final String? text;
  final IconData? icon;
  final bool? isIcon;
  const AppButton({
    Key? key, required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
    this.text= "Hi",
    this.icon,
    this.isIcon=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height:size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor,width: 2.0),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child:isIcon==false? Center(child: AppText(text: text!,size: 18,color:color,)):Center(child: Icon(icon,color:color)),
    );
  }
}
