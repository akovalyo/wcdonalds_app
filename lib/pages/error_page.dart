import 'package:flutter/material.dart';

import '../widgets/wc_bar.dart';
import '../theme/theme.dart';
import '../widgets/wc_drawer.dart';
import '../widgets/hyperlink.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  static Page page({LocalKey? key}) => MaterialPage<void>(
        key: key,
        child: const ErrorPage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: const WcBar(),
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          AppTheme.wcBarHeight,
        ),
      ),
      drawer: const WcDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                  width: 150,
                  height: 150,
                  child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/worker_sad.png'))),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Oops! Looks like the page doesn\'t exist.',
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const Hyperlink(
                title: 'Return to the Home page',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
