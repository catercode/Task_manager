import 'package:flutter/material.dart';

class NormalTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int maxLines;
  final double? height;
  final double wordSpacing;
  final double letterSpacing;

  final String fontFamily;

  const NormalTextWidget(
      {Key? key,
      required this.text,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 14,
      this.maxLines = 1,
      this.textAlign = TextAlign.left,
      this.height = 1,
      this.fontFamily = "OpenSans",
      this.wordSpacing = 0,
      this.letterSpacing = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          wordSpacing: wordSpacing,
          letterSpacing: letterSpacing,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          color: color,
          height: height),
    );
  }
}
