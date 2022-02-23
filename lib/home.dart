import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'tabs/tabs.dart';
import 'models/app_state.dart';
import 'widgets/wc_bar.dart';
import 'theme/theme.dart';
import 'widgets/wc_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> tabs = Tabs.listWidgets();

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    return Scaffold(
      appBar: PreferredSize(
        child: const WcBar(),
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          wcBarHeight,
        ),
      ),
      drawer: const WcDrawer(),
      body: IndexedStack(index: _selectedIndex, children: tabs),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedIndex,
        onTap: (index) {
          _onTabTapped(index);
        },
        items: Tabs.listNavigationBarItems(),
      ),
    );
  }
}
