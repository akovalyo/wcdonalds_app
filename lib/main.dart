import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme/theme.dart';
import 'home.dart';
import 'models/app_state.dart';

void main() {
  runApp(const WcdonaldsApp());
}

class WcdonaldsApp extends StatelessWidget {
  const WcdonaldsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
      ],
      child: MaterialApp(
        title: 'Welcome to Wcdonalds!',
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
