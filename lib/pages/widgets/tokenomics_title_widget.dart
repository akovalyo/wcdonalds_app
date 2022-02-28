import 'package:flutter/material.dart';

class TokenomicsTitleWidget extends StatelessWidget {
  final String title;

  const TokenomicsTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontFamily: Theme.of(context).textTheme.headline4?.fontFamily,
          fontSize: Theme.of(context).textTheme.headline4?.fontSize,
          color: Colors.black),
    );
  }
}
