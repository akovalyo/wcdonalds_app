import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListView(
      padding: const EdgeInsets.only(top: 20),
      children: [
        Align(
          alignment: Alignment.center,
          child: Image(
            image: const AssetImage('assets/images/logo_y.png'),
            width: 0.2 * width,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
            child: Text(
          'Welcome to Wcdonalds!',
          style: Theme.of(context).textTheme.headline3,
        )),
      ],
    );
  }
}
