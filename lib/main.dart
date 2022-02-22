import 'package:flutter/material.dart';
import 'theme/theme.dart';
import 'home.dart';

void main() {
  runApp(const WcdonaldsApp());
}

class WcdonaldsApp extends StatelessWidget {
  const WcdonaldsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Wcdonalds!',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
