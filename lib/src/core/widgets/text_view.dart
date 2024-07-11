import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  const TextView(
    this.title, {
    super.key,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.textAlign,
  });

  final String title;
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: TextDecoration.none,
        fontFamily: fontFamily,
      ),
      textAlign: textAlign,
    );
  }
}
