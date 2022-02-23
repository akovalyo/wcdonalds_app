import 'package:flutter/material.dart';

class WcBar extends StatelessWidget {
  const WcBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: ImageIcon(
        const AssetImage('assets/images/logo_y.png'),
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
