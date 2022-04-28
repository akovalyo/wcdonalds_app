import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:wcdonalds_app/navigation/routes.dart';
import 'package:go_router/go_router.dart';

import '../models/app_state.dart';
import '../widgets/hyperlink.dart';

class WcDrawer extends StatefulWidget {
  const WcDrawer({Key? key}) : super(key: key);

  @override
  State<WcDrawer> createState() => _WcDrawerState();
}

class _WcDrawerState extends State<WcDrawer> {
  PackageInfo _packageInfo = PackageInfo(
    appName: '',
    packageName: '',
    version: '',
    buildNumber: '',
    buildSignature: '',
  );

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final appState = context.watch<AppState>();

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    height: height * 0.2,
                    constraints: const BoxConstraints(
                      minHeight: 100,
                    ),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                      bottom: 10,
                    ),
                    child: Hyperlink(
                        link: Routes.home.path,
                        underline: false,
                        color: Theme.of(context).textTheme.bodyText1?.color,
                        title: 'Home'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Hyperlink(
                        link: Routes.calculator.path,
                        underline: false,
                        color: Theme.of(context).textTheme.bodyText1?.color,
                        title: 'Paycheck Calculator'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dark Mode',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Switch(
                          value: appState.isDarkTheme,
                          onChanged: (_) {
                            appState.changeTheme();
                          },
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: Text(
                "v${_packageInfo.version}",
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Hyperlink(
                title: 'Privacy Policy',
                link:
                    'https://www.privacypolicies.com/live/7c6ad4b3-d621-450a-88e5-2a33906f0dd3',
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
