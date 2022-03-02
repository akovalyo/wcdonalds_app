import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import 'headers/hero_header.dart';
import '../widgets/wc_drawer.dart';
import '../navigation/routes.dart';
import '../widgets/text_paragraph.dart';
import '../widgets/expandable_container.dart';
import '../models/url_launcher.dart';
import '../theme/theme.dart';
import '../pages/tokenomics_page/tokenomics_page.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);

  static Page page({LocalKey? key}) => MaterialPage<void>(
        key: key,
        child: const FaqPage(),
      );

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 16;
    const double verticalPadding = 8;
    timeDilation = 2.0;
    const meUrl = 'https://www.magiceden.io/marketplace/wcdonalds_workers';
    const generalColor = Color.fromARGB(255, 107, 213, 245);
    const stakingColor = Color.fromARGB(255, 107, 128, 245);

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
                color: Color.fromARGB(255, 96, 173, 236),
                onTap: () {
                  Routes.popPageHandler(context, Routes.home.path);
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    // ===== Section =====
                    Text(
                      'GENERAL QUESTIONS',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // ===== Question =====
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: verticalPadding,
                          horizontal: horizontalPadding),
                      child: ExpandableContainer(
                        titleWidget: const TextParagraph(
                          'What is Wcdonalds? ',
                          textAlign: TextAlign.left,
                          bold: true,
                        ),
                        expandedHeight: 220,
                        color: generalColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            TextParagraph(
                              'Wcdonalds is the best fast food enterprise one the Solana Blockchain. We hire and train Wcworkers each has its own rarity and attributes.',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ===== Question =====

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: verticalPadding,
                          horizontal: horizontalPadding),
                      child: ExpandableContainer(
                        titleWidget: const TextParagraph(
                          'What is the supply? ',
                          textAlign: TextAlign.left,
                          bold: true,
                        ),
                        expandedHeight: 220,
                        color: generalColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            TextParagraph(
                              'We had a total of 2222 positions. All filled (sold out) - Workers counter  [2218/2222]',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ===== Question =====
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: verticalPadding,
                          horizontal: horizontalPadding),
                      child: ExpandableContainer(
                        collapsedHeight: 70,
                        expandedHeight: 300,
                        titleWidget: const TextParagraph(
                          'Why is worker counter less than total NFTs minted ',
                          bold: true,
                          textAlign: TextAlign.left,
                        ),
                        color: generalColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            TextParagraph(
                              'A total of 4 workers have been fired (by feb 2022).',
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 6),
                            TextParagraph(
                              '• Workers 1172 and 1369 fired because a fight inside wcdonalds.',
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 6),
                            TextParagraph(
                              '• Worker 1216, fired because of his hate to pickles.',
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 6),
                            TextParagraph(
                              '• Worker 1349, fired because his lack of hygiene.',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ===== Question =====
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: verticalPadding,
                          horizontal: horizontalPadding),
                      child: ExpandableContainer(
                        titleWidget: const TextParagraph(
                          'What was the mint price? ',
                          textAlign: TextAlign.left,
                          bold: true,
                        ),
                        expandedHeight: 100,
                        color: generalColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            TextParagraph(
                              '0.01 \$SOL',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ===== Question =====
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: verticalPadding,
                          horizontal: horizontalPadding),
                      child: ExpandableContainer(
                        titleWidget: const TextParagraph(
                          'Is it listed on a secondary market?',
                          textAlign: TextAlign.left,
                          bold: true,
                        ),
                        expandedHeight: 250,
                        collapsedHeight: 70,
                        color: generalColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextParagraph(
                              'Yes ser, you can get your worker in ME:',
                              textAlign: TextAlign.left,
                            ),
                            TextButton(
                                onPressed: () async {
                                  final result =
                                      await UrlLauncher.openInBrowser(meUrl);
                                  if (!result) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            const Text('Can not open the url'),
                                        backgroundColor: Theme.of(context)
                                            .errorColor
                                            .withOpacity(0.7),
                                      ),
                                    );
                                  }
                                },
                                child: const TextParagraph(meUrl))
                          ],
                        ),
                      ),
                    ),

                    // ===== Question =====
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: verticalPadding,
                          horizontal: horizontalPadding),
                      child: ExpandableContainer(
                        titleWidget: const TextParagraph(
                          'What is the WAO?',
                          textAlign: TextAlign.left,
                          bold: true,
                        ),
                        expandedHeight: 200,
                        color: generalColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            TextParagraph(
                              'WAO is our DAO because DAO is for losers and WAO is for WINNERS. W = WAGMI',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ===== Question =====
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: verticalPadding,
                          horizontal: horizontalPadding),
                      child: ExpandableContainer(
                        titleWidget: const TextParagraph(
                          'What is the utility of being a holder?',
                          textAlign: TextAlign.left,
                          bold: true,
                        ),
                        expandedHeight: 450,
                        collapsedHeight: 70,
                        color: generalColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            TextParagraph(
                              '• Contribute to the construction and rising of the best enterprise of the metaverse.',
                              textAlign: TextAlign.left,
                            ),
                            TextParagraph(
                              '• NFT Staking. ',
                              textAlign: TextAlign.left,
                            ),
                            TextParagraph(
                              '• IRL utility: Meal time (we airdrop 0.1 \$SOL randomly to anyone who uploads a picture of the MWcdonalds meal he or she has with the receipt.',
                              textAlign: TextAlign.left,
                            ),
                            TextParagraph(
                              '• You decide the destiny of some workers with the Human Resources Team.',
                              textAlign: TextAlign.left,
                            ),
                            TextParagraph(
                              '• Holders airdrops.',
                              textAlign: TextAlign.left,
                            ),
                            TextParagraph(
                              '• A lot more to come...',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ===== Question =====
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: verticalPadding,
                          horizontal: horizontalPadding),
                      child: ExpandableContainer(
                        titleWidget: const TextParagraph(
                          'How does Human Resources works?',
                          textAlign: TextAlign.left,
                          bold: true,
                        ),
                        expandedHeight: 500,
                        collapsedHeight: 70,
                        color: generalColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextParagraph(
                              'Randomly human resources team leaded by @WcRex will do inspections to some franchise then she will pick up some lazy workers or workers that are doing a bad job. Some of them are fired (out of circulation) and others are sent to training (Giveaway).',
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 12),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '• Wanager: ',
                                    style: AppTheme.richTextBody1Black(context,
                                        bold: true),
                                  ),
                                  TextSpan(
                                    text: 'Holding 1+ Wcdonalds Worker',
                                    style: AppTheme.richTextBody1Black(context),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '• Executive Wanager: ',
                                    style: AppTheme.richTextBody1Black(context,
                                        bold: true),
                                  ),
                                  TextSpan(
                                    text: 'Holding 10- 19 WcWorkers',
                                    style: AppTheme.richTextBody1Black(context),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '• Chief Wanager: ',
                                    style: AppTheme.richTextBody1Black(context,
                                        bold: true),
                                  ),
                                  TextSpan(
                                    text: 'Holding 20 - 29 Wc Workers',
                                    style: AppTheme.richTextBody1Black(context),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '• Global Wanager: ',
                                    style: AppTheme.richTextBody1Black(context,
                                        bold: true),
                                  ),
                                  TextSpan(
                                    text: 'Holding 30+ WcWorkers',
                                    style: AppTheme.richTextBody1Black(context),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ===== Question =====
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: verticalPadding,
                          horizontal: horizontalPadding),
                      child: ExpandableContainer(
                        titleWidget: const TextParagraph(
                          'About the team',
                          textAlign: TextAlign.left,
                          bold: true,
                        ),
                        expandedHeight: 700,
                        color: generalColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            TextParagraph(
                              'We truly believe in the NFTs community and the potential to change the world. We started this project because we got tired of all those ruggs going on. So we wanted to show the community that with diligence and honesty you can actually create a project with value and at the same time have fun. So here we are. ',
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 12),
                            TextParagraph(
                              'Wcdonald Worker:',
                              textAlign: TextAlign.left,
                              bold: true,
                            ),
                            TextParagraph(
                              '• Full stack web dev;',
                              textAlign: TextAlign.left,
                            ),
                            TextParagraph(
                              '• Art director;',
                              textAlign: TextAlign.left,
                            ),
                            TextParagraph(
                              '• Community Wanager;',
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 12),
                            TextParagraph(
                              'WcRex:',
                              textAlign: TextAlign.left,
                              bold: true,
                            ),
                            TextParagraph(
                              '• UI designer;',
                              textAlign: TextAlign.left,
                            ),
                            TextParagraph(
                              '• Graphic Artist;',
                              textAlign: TextAlign.left,
                            ),
                            TextParagraph(
                              '• Brand designer;',
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 12),
                            TextParagraph(
                              'WcShiba:',
                              textAlign: TextAlign.left,
                              bold: true,
                            ),
                            TextParagraph(
                              '• User experience designer (gamification focused);',
                              textAlign: TextAlign.left,
                            ),
                            TextParagraph(
                              '• Game designer;',
                              textAlign: TextAlign.left,
                            ),
                            TextParagraph(
                              '• Writer;',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ===== Question =====
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: verticalPadding,
                          horizontal: horizontalPadding),
                      child: ExpandableContainer(
                        titleWidget: const TextParagraph(
                          'Holder Roles?',
                          textAlign: TextAlign.left,
                          bold: true,
                        ),
                        expandedHeight: 250,
                        color: generalColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            TextParagraph(
                              'We have 4 tier roles: ',
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 12),
                            TextParagraph(
                              'To know more about this floor sweeping mechanic check discord, go to #🤲-human-resources and #👔-hire-some-workers channels.',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    // ===== Section =====
                    Text(
                      'STAKING QUESTIONS',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // ===== Question =====
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: verticalPadding,
                          horizontal: horizontalPadding),
                      child: ExpandableContainer(
                        titleWidget: const TextParagraph(
                          'How many wcdollars does the staked worker (legendary worker) generate?',
                          textAlign: TextAlign.left,
                          bold: true,
                        ),
                        expandedHeight: 650,
                        collapsedHeight: 100,
                        color: stakingColor,
                        child: TokenomicsPage.workersWage(context),
                      ),
                    ),

                    // ===== Question =====
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: verticalPadding,
                          horizontal: horizontalPadding),
                      child: ExpandableContainer(
                        titleWidget: const TextParagraph(
                          'What is the benefit to own a franchise, wanager?',
                          textAlign: TextAlign.left,
                          bold: true,
                        ),
                        expandedHeight: 450,
                        collapsedHeight: 70,
                        color: stakingColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            TextParagraph(
                              'What is the benefit to own a franchise, wanager?',
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 12),
                            TextParagraph(
                              'You will be able to stake your Franchise and Wanagers. Franchise will get 20% of all the \$WcDollars claimed per day. Also you will be able to get a worker reassigned to you.',
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 6),
                            TextParagraph(
                              'Wanagers will reduce the risk of unstaking a worker and get reassigned to another franchise. Also they have a wage, this means every wanager will generate \$WcDollars too. ',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ===== Question =====
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: verticalPadding,
                          horizontal: horizontalPadding),
                      child: ExpandableContainer(
                        titleWidget: const TextParagraph(
                          'Do I need a Franchise to stake my workers?',
                          textAlign: TextAlign.left,
                          bold: true,
                        ),
                        expandedHeight: 200,
                        collapsedHeight: 70,
                        color: stakingColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            TextParagraph(
                              'No, you can stake your workers without a Franchise. Franchise have its own utilities.',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ===== Question =====
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: verticalPadding,
                          horizontal: horizontalPadding),
                      child: ExpandableContainer(
                        titleWidget: const TextParagraph(
                          'What does it mean that my worker can be reassigned when I unstake?',
                          textAlign: TextAlign.left,
                          bold: true,
                        ),
                        expandedHeight: 200,
                        collapsedHeight: 70,
                        color: stakingColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            TextParagraph(
                              'It means you can lose your worker and someone with an Staked Franchise can win that worker. ',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ===== Question =====
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: verticalPadding,
                          horizontal: horizontalPadding),
                      child: ExpandableContainer(
                        titleWidget: const TextParagraph(
                          'How to lower risk of loosing my worker?',
                          textAlign: TextAlign.left,
                          bold: true,
                        ),
                        expandedHeight: 200,
                        collapsedHeight: 70,
                        color: stakingColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            TextParagraph(
                              'With some Wanagers, depending on the rank of the Wanager you have staked you will reduce the chances of getting your Worker reassigned. ',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ===== Question =====
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: verticalPadding,
                          horizontal: horizontalPadding),
                      child: ExpandableContainer(
                        titleWidget: const TextParagraph(
                          'Is it fair that I can loose my worker?',
                          textAlign: TextAlign.left,
                          bold: true,
                        ),
                        expandedHeight: 200,
                        collapsedHeight: 70,
                        color: stakingColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            TextParagraph(
                              'That is part of the risk game. It is part of the system, if there is no risk then it would be less attractive and less profitable.',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
