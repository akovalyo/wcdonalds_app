import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import '../widgets/wc_drawer.dart';
import 'headers/hero_header.dart';
import '../navigation/routes.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);

  static MaterialPage page({LocalKey? key}) => MaterialPage(
        name: Routes.tokenomics,
        key: key,
        child: const FaqPage(),
      );

  //TODO: static MaterialPageRoute ...

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0;
    return Scaffold(
      drawer: const WcDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              child: HeroHeader(
                tag: 'faq',
                title: 'FAQ',
                image: 'assets/images/faq.png',
                showBackButton: true,
                color: const Color(0xFF64B5F6),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        height: 20,
                      ),
                      Text('FAQ'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
