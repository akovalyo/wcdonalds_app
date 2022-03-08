import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  static Page page({LocalKey? key}) => MaterialPage<void>(
        key: key,
        child: const ErrorPage(),
      );

  @override
  Widget build(BuildContext context) {
    //TODO:
    return const SizedBox();
  }
}
