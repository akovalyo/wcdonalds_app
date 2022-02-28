import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import '../widgets/wc_drawer.dart';
import 'headers/hero_header.dart';
import '../navigation/routes.dart';
import '../widgets/wc_bar.dart';
import 'widgets/expandable_container.dart';
import 'widgets/tokenomics_title_widget.dart';

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
                    children: const [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ExpandableContainer(
                          titleWidget:
                              TokenomicsTitleWidget(title: 'STAKING GAME'),
                          expandedHeight: 500,
                          color: Color(0xFF64B5F6),
                          child: Text(
                              'jhdsfjghkdfjshgkj fkjkjk kjdfkgjsdkf jdkg jkdjgskdjfgk jkdfj kgjhfjhgkjhkhf ujkjb'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ExpandableContainer(
                          titleWidget:
                              TokenomicsTitleWidget(title: 'TOKENOMICS'),
                          expandedHeight: 300,
                          color: Color(0xFFE57373),
                          child: Text(
                              'jhdsfjghkdfjshgkj fkjkjk kjdfkgjsdkf jdkg jkdjgskdjfgk jkdfj kgjhfjhgkjhkhf ujkjb'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ExpandableContainer(
                          titleWidget: TokenomicsTitleWidget(title: 'WCDOLLAR'),
                          expandedHeight: 300,
                          color: Color(0xFF81C784),
                          child: Text(
                              'jhdsfjghkdfjshgkj fkjkjk kjdfkgjsdkf jdkg jkdjgskdjfgk jkdfj kgjhfjhgkjhkhf ujkjb'),
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
