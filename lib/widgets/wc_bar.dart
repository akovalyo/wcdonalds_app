import 'package:flutter/material.dart';

class WcBar extends StatelessWidget {
  final bool backButton;
  const WcBar({Key? key, this.backButton = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      actions: [
        if (backButton)
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )
      ],
      title: ImageIcon(
        const AssetImage('assets/images/logo_y.png'),
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
