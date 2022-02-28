import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import '../widgets/wc_drawer.dart';
import 'headers/hero_header.dart';
import '../navigation/routes.dart';
import '../widgets/wc_bar.dart';

class TokenomicsPage extends StatelessWidget {
  const TokenomicsPage({Key? key}) : super(key: key);

  static Page page({LocalKey? key}) => MaterialPage<void>(
        key: key,
        child: const TokenomicsPage(),
      );

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
                tag: 'tokenomics',
                title: 'TOKENOMICS',
                image: 'assets/images/wcdollar.png',
                showBackButton: true,
                color: const Color(0xFFFF8A65),
                onTap: () {
                  Routes.popPageHandler(context, Routes.home.path);
                },
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 400,
                          height: 300,
                          color: Colors.red[300],
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Text(
                                'STAKING GAME',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 400,
                          height: 300,
                          color: Colors.green[300],
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Text(
                                'WCDOLLAR',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ],
                          ),
                        ),
                      ),
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
