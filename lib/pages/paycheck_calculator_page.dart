import 'package:flutter/material.dart';

import '../widgets/wc_bar.dart';
import '../theme/theme.dart';
import '../widgets/wc_drawer.dart';

class PaycheckCalculatorPage extends StatefulWidget {
  const PaycheckCalculatorPage({Key? key}) : super(key: key);

  static Page page({LocalKey? key}) => MaterialPage<void>(
        key: key,
        child: const PaycheckCalculatorPage(),
      );

  @override
  State<PaycheckCalculatorPage> createState() => _PaycheckCalculatorPageState();
}

class _PaycheckCalculatorPageState extends State<PaycheckCalculatorPage> {
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
      body: const Center(
        child: Text('Paycheck Calculator'),
      ),
    );
  }
}
