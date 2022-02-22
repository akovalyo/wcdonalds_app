import 'package:flutter/material.dart';
import './tabs/tabs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ImageIcon(
          AssetImage('assets/images/logo_y.png'),
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      body: Tabs.listWidgets()[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        items: Tabs.listNavigationBarItems(),
      ),
    );
  }
}
