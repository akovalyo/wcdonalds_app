import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'tabs/tabs.dart';
import 'models/app_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Consumer<AppState>(builder: (context, appState, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: ImageIcon(
            const AssetImage('assets/images/logo_y.png'),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        drawer: Drawer(
          child: SafeArea(
            child: ListView(
              children: [
                Container(
                  height: height * 0.2,
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  child: const Align(
                    alignment: Alignment.center,
                    child: Image(
                      width: 50,
                      height: 50,
                      image: AssetImage('assets/images/logo_y.png'),
                    ),
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
        ),
        body: Tabs.listWidgets()[appState.selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          currentIndex: appState.selectedTab,
          onTap: (index) {
            appState.goToTab(index);
          },
          items: Tabs.listNavigationBarItems(),
        ),
      );
    });
  }
}
