import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../models/app_state.dart';

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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Dark Mode'),
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
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                "v${_packageInfo.version}",
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
