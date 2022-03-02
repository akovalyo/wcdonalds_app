import 'package:flutter/material.dart';

class TextParagraph extends StatelessWidget {
  final String text;
  final bool fontFamilyHeadline;
  final double fontSize;
  final bool bold;
  final TextAlign textAlign;
  const TextParagraph(
    this.text, {
    Key? key,
    this.textAlign = TextAlign.center,
    this.fontFamilyHeadline = false,
    this.fontSize = 18,
    this.bold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: fontFamilyHeadline
            ? Theme.of(context).textTheme.headline1?.fontFamily
            : Theme.of(context).textTheme.bodyText1?.fontFamily,
        fontSize: fontSize,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        color: Colors.black,
      ),
    );
  }
}
