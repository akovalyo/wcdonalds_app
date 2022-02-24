import 'package:flutter/material.dart';

import '../navigation/routes.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  static MaterialPage page({LocalKey? key}) => MaterialPage(
        name: Routes.error,
        key: key,
        child: const ErrorPage(),
      );

  @override
  Widget build(BuildContext context) {
    //TODO:
    return Container();
  }
}
