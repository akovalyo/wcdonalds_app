import 'package:flutter/material.dart';
import 'news_tab.dart';
import 'workers_tab.dart';
import 'welcome_tab.dart';

class Tab {
  final String label;
  final Widget widget;
  final Widget icon;
  final Widget? activeIcon;

  Tab({
    required this.label,
    required this.widget,
    required this.icon,
    this.activeIcon,
  });
}

class Tabs {
  static final home = Tab(
    label: 'Wcdonalds',
    widget: WelcomeTab(),
    icon: const ImageIcon(AssetImage('assets/images/logo_w.png')),
  );

  static final news = Tab(
    label: 'News',
    widget: const NewsTab(),
    icon: const Icon(Icons.newspaper),
  );

  static final workers = Tab(
    label: 'Workers',
    widget: const WorkersTab(),
    icon: const ImageIcon(AssetImage('assets/images/worker_w.png')),
  );

  static final List<Tab> all = [
    Tabs.home,
    Tabs.news,
    Tabs.workers,
  ];

  static List<Widget> listWidgets() {
    return Tabs.all.map((e) => e.widget).toList();
  }

  static List<BottomNavigationBarItem> listNavigationBarItems() {
    return Tabs.all
        .map(
          (e) => BottomNavigationBarItem(
            label: e.label,
            icon: e.icon,
          ),
        )
        .toList();
  }
}
