import 'package:flutter/material.dart';

import '../widgets/wc_bar.dart';
import '../theme/theme.dart';
import '../widgets/wc_drawer.dart';
import '../models/paycheck_calculator.dart';

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
  final _formKey = GlobalKey<FormState>();
  final _workersListController = TextEditingController();
  final PaycheckCalculator calculator = PaycheckCalculator();

  @override
  void initState() {
    calculator.load();
    super.initState();
  }

  @override
  void dispose() {
    _workersListController.dispose();
    super.dispose();
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
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text('Paycheck calculator',
                  style: Theme.of(context).textTheme.headline4),
              const SizedBox(
                height: 20,
              ),
              const Text('Workers on duty:'),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Add workers'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
