import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/welcome.jpg'),
        ),
      ),
    );
  }
}
