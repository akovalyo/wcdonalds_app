import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import '../../widgets/wc_drawer.dart';
import '../headers/hero_header.dart';
import '../../navigation/routes.dart';
import '../page_widgets/expandable_container.dart';
import '../page_widgets/tokenomics_title_widget.dart';
import 'expandable_containers/staking_game_container.dart';
import 'expandable_containers/tokenomics_container_default.dart';
import '../../widgets/text_paragraph.dart';
import '../../theme/theme.dart';
import 'expandable_containers/whappy_meal_container.dart';

class TokenomicsPage extends StatelessWidget {
  const TokenomicsPage({Key? key}) : super(key: key);

  static Page page({LocalKey? key}) => MaterialPage<void>(
        key: key,
        child: const TokenomicsPage(),
      );

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 16;
    const double verticalPadding = 8;
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
                image: 'assets/images/chart.png',
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
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: verticalPadding,
                            horizontal: horizontalPadding),
                        child: ExpandableContainer(
                          titleWidget:
                              TokenomicsTitleWidget(title: 'STAKING GAME'),
                          expandedHeight: 500,
                          color: Color(0xFF64B5F6),
                          child: StakingGameContainer(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: verticalPadding,
                            horizontal: horizontalPadding),
                        child: ExpandableContainer(
                          titleWidget:
                              const TokenomicsTitleWidget(title: 'WCDOLLAR'),
                          expandedHeight: 350,
                          color: const Color(0xFF81C784),
                          child: TokenomicsContainerDefault(
                            title: '\$THE WCDOLLAR',
                            imagePath: 'assets/images/wcdollar.png',
                            body: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                TextParagraph(
                                    'The \$WcDollar is the precious money we pay our workers. With it you can pay Whappy Meals and it will have more utility in the future.'),
                                SizedBox(height: 6),
                                TextParagraph(
                                    'The Maximum \$WcDollar supply is 20.000.000'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: verticalPadding,
                            horizontal: horizontalPadding),
                        child: ExpandableContainer(
                          titleWidget:
                              const TokenomicsTitleWidget(title: 'RISKY GAME'),
                          expandedHeight: 650,
                          color: const Color(0xFFE57373),
                          child: TokenomicsContainerDefault(
                            imagePath: 'assets/images/dice.png',
                            body: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const TextParagraph(
                                    'When you unstake a worker, you have the possibility of that worker being reassigned by human resources to another staked franchises.'),
                                const SizedBox(height: 6),
                                const TextParagraph(
                                    'This chance is lowered if you have a Wanager in stake:'),
                                const SizedBox(height: 12),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '• No wanager: ',
                                        style: AppTheme.richTextBody1Black(
                                            context,
                                            bold: true),
                                      ),
                                      TextSpan(
                                        text: '15% chances to lose your worker',
                                        style: AppTheme.richTextBody1Black(
                                            context),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '• Executive: ',
                                        style: AppTheme.richTextBody1Black(
                                            context,
                                            bold: true),
                                      ),
                                      TextSpan(
                                        text: '10% chances to lose your worker',
                                        style: AppTheme.richTextBody1Black(
                                            context),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '• Chief: ',
                                        style: AppTheme.richTextBody1Black(
                                            context,
                                            bold: true),
                                      ),
                                      TextSpan(
                                        text: '5% chances to lose your worker',
                                        style: AppTheme.richTextBody1Black(
                                            context),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '• Global: ',
                                        style: AppTheme.richTextBody1Black(
                                            context,
                                            bold: true),
                                      ),
                                      TextSpan(
                                        text: '1% chances to lose your worker',
                                        style: AppTheme.richTextBody1Black(
                                            context),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: verticalPadding,
                            horizontal: horizontalPadding),
                        child: ExpandableContainer(
                          titleWidget: const TokenomicsTitleWidget(
                              title: 'WORKERS WAGE'),
                          expandedHeight: 700,
                          color: const Color.fromRGBO(255, 241, 118, 1),
                          child: TokenomicsContainerDefault(
                            imagePath: 'assets/images/worker_wback.png',
                            body: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const TextParagraph(
                                    'Each staked worker generates a wage depending on its rarity rank. The \$WcDollar generated by each worker goes like this.'),
                                const SizedBox(height: 12),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '• Rank 2222 to 1999 = ',
                                        style: AppTheme.richTextBody1Black(
                                            context,
                                            bold: true),
                                      ),
                                      TextSpan(
                                        text: '95 \$WcDollars per day',
                                        style: AppTheme.richTextBody1Black(
                                            context),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '• Rank 1998 to 1499 = ',
                                        style: AppTheme.richTextBody1Black(
                                            context,
                                            bold: true),
                                      ),
                                      TextSpan(
                                        text: '100 \$WcDollars per day',
                                        style: AppTheme.richTextBody1Black(
                                            context),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '• Rank 1498 to 999 = ',
                                        style: AppTheme.richTextBody1Black(
                                            context,
                                            bold: true),
                                      ),
                                      TextSpan(
                                        text: '115 \$WcDollars per day',
                                        style: AppTheme.richTextBody1Black(
                                            context),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '• Rank 998 to 500 = ',
                                        style: AppTheme.richTextBody1Black(
                                            context,
                                            bold: true),
                                      ),
                                      TextSpan(
                                        text: '124 \$WcDollars per day',
                                        style: AppTheme.richTextBody1Black(
                                            context),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '• Rank 499 to 100 = ',
                                        style: AppTheme.richTextBody1Black(
                                            context,
                                            bold: true),
                                      ),
                                      TextSpan(
                                        text: '134 \$WcDollars per day',
                                        style: AppTheme.richTextBody1Black(
                                            context),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '• Rank 99 to 11 = ',
                                        style: AppTheme.richTextBody1Black(
                                            context,
                                            bold: true),
                                      ),
                                      TextSpan(
                                        text: '148 \$WcDollars per day',
                                        style: AppTheme.richTextBody1Black(
                                            context),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '• Rank 10 to 1 = ',
                                        style: AppTheme.richTextBody1Black(
                                            context,
                                            bold: true),
                                      ),
                                      TextSpan(
                                        text: '155 \$WcDollars per day',
                                        style: AppTheme.richTextBody1Black(
                                            context),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '• Legendary worker = ',
                                        style: AppTheme.richTextBody1Black(
                                            context,
                                            bold: true),
                                      ),
                                      TextSpan(
                                        text: '180 \$WcDollars per day',
                                        style: AppTheme.richTextBody1Black(
                                            context),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: verticalPadding,
                            horizontal: horizontalPadding),
                        child: ExpandableContainer(
                          titleWidget: const TokenomicsTitleWidget(
                              title: 'WANAGERS WAGE'),
                          expandedHeight: 700,
                          color: const Color.fromRGBO(186, 104, 200, 1),
                          child: TokenomicsContainerDefault(
                            imagePath: 'assets/images/global.gif',
                            body: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const TextParagraph(
                                    'Staked Wanagers also generate a wage depending on its rank:'),
                                const SizedBox(height: 12),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '• Executive Wanager: ',
                                        style: AppTheme.richTextBody1Black(
                                            context,
                                            bold: true),
                                      ),
                                      TextSpan(
                                        text:
                                            '2 \$WcDollars for each staked worker per day',
                                        style: AppTheme.richTextBody1Black(
                                            context),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '• Chief Wanager: ',
                                        style: AppTheme.richTextBody1Black(
                                            context,
                                            bold: true),
                                      ),
                                      TextSpan(
                                        text:
                                            '4 \$WcDollars for each staked worker per day',
                                        style: AppTheme.richTextBody1Black(
                                            context),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '• Global Wanager: ',
                                        style: AppTheme.richTextBody1Black(
                                            context,
                                            bold: true),
                                      ),
                                      TextSpan(
                                        text:
                                            '6 \$WcDollars for each staked worker per day',
                                        style: AppTheme.richTextBody1Black(
                                            context),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: verticalPadding,
                            horizontal: horizontalPadding),
                        child: ExpandableContainer(
                          titleWidget:
                              TokenomicsTitleWidget(title: 'WHAPPY MEAL'),
                          expandedHeight: 1100,
                          color: Color.fromRGBO(239, 83, 80, 1),
                          child: WhappyMealContainer(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: verticalPadding,
                            horizontal: horizontalPadding),
                        child: ExpandableContainer(
                          titleWidget:
                              const TokenomicsTitleWidget(title: 'WCTOYS'),
                          expandedHeight: 500,
                          color: const Color.fromRGBO(174, 213, 129, 1),
                          child: TokenomicsContainerDefault(
                            imagePath: 'assets/images/toys.png',
                            body: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const TextParagraph(
                                    'The most common drop from our Whappy Meals are toys. These will have some utility also, so they will have value beyond the collectible Meel.'),
                                const SizedBox(height: 12),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '• Big Wac Raffle: ',
                                        style: AppTheme.richTextBody1Black(
                                            context,
                                            bold: true),
                                      ),
                                      TextSpan(
                                        text:
                                            'If you complete a full TOY collection, you will get a ticket for the Big Wac Raffle.',
                                        style: AppTheme.richTextBody1Black(
                                            context),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '• Recycle: ',
                                        style: AppTheme.richTextBody1Black(
                                            context,
                                            bold: true),
                                      ),
                                      TextSpan(
                                        text:
                                            'You can use (burn) 3 TOYS to open a new Meal',
                                        style: AppTheme.richTextBody1Black(
                                            context),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
