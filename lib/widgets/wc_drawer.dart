import 'package:flutter/material.dart';

class WcDrawer extends StatelessWidget {
  const WcDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            Container(
              height: height * 0.2,
              color: Theme.of(context).appBarTheme.backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(
                    width: 50,
                    height: 50,
                    image: AssetImage('assets/images/logo_y.png'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image(
                    height: 30,
                    image: AssetImage('assets/images/wcdonalds.png'),
                  ),
                ],
              ),

              // const Align(
              //   alignment: Alignment.center,
              //   child: Image(
              //     width: 50,
              //     height: 50,
              //     image: AssetImage('assets/images/logo_y.png'),
              //   ),
              // ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
