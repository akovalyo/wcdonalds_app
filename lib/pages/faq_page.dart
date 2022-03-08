import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'headers/hero_header.dart';

import '../widgets/wc_drawer.dart';
import '../widgets/app_circular_progress_indicator.dart';
import '../navigation/routes.dart';
import '../theme/theme.dart';
import '../models/request.dart';
import '../models/json_handler.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  static Page page({LocalKey? key}) => MaterialPage<void>(
        key: key,
        child: const FaqPage(),
      );

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
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
                tag: 'faq',
                title: 'FAQ',
                image: 'assets/images/faq.png',
                showBackButton: true,
                color: const Color.fromARGB(255, 96, 173, 236),
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
                    FutureBuilder(
                      future: Request.local('assets/data/faq.json'),
                      builder: (BuildContext context,
                          AsyncSnapshot<Map<String, dynamic>> snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                'Sorry, something went wrong',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ),
                          );
                        }
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData) {
                          List<Widget> widgets = [];

                          snapshot.data?.forEach(
                              (String titleSection, questionsSection) {
                            widgets.add(const SizedBox(
                              height: 20,
                            ));
                            widgets.add(
                              Text(
                                titleSection.toUpperCase(),
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            );

                            questionsSection['entries'].forEach((entry) {
                              widgets.add(const SizedBox(
                                height: 10,
                              ));
                              widgets.add(Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: verticalPadding,
                                    horizontal: horizontalPadding),
                                child:
                                    JsonHandler.convertIntoExpandableContainer(
                                  context: context,
                                  title: entry['question'],
                                  body: entry['answer'],
                                  textAlign: TextAlign.start,
                                  expandedHeight:
                                      entry['expandedHeight'] != null
                                          ? entry['expandedHeight'].toDouble()
                                          : AppTheme.expandedWidgetHeight,
                                  collapsedHeight:
                                      entry['collapsedHeight'] != null
                                          ? entry['collapsedHeight'].toDouble()
                                          : AppTheme.collapsedWidgetHeight,
                                  color: questionsSection['color'],
                                ),
                              ));
                            });
                          });

                          return Column(
                            children: widgets,
                          );
                        } else {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: AppCircularProgressIndicator(),
                            ),
                          );
                        }
                      },
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
