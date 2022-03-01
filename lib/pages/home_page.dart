import 'package:flutter/material.dart';

import '../tabs/tabs.dart';
import '../widgets/wc_bar.dart';
import '../theme/theme.dart';
import '../widgets/wc_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page({LocalKey? key}) => MaterialPage<void>(
        key: key,
        child: const HomePage(),
      );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> tabs = Tabs.listWidgets();

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
