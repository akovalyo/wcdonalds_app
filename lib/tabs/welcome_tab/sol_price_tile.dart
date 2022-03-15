import 'package:flutter/material.dart';

import '../../models/request.dart';
import '../../widgets/image_placeholder.dart';

class SolPriceTile extends StatefulWidget {
  const SolPriceTile({Key? key}) : super(key: key);

  @override
  State<SolPriceTile> createState() => _SolPriceTileState();
}

class _SolPriceTileState extends State<SolPriceTile> {
  String solPrice = '?';

  @override
  void initState() {
    getSolPrice();
    super.initState();
  }

  void getSolPrice() async {
    try {
      final response = await Request.get(
          'https://api.binance.com/api/v3/avgPrice?symbol=SOLUSDT');
      setState(() {
        solPrice = response['price'];
      });
    } catch (e) {
      setState(() {
        solPrice = '?';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getSolPrice();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: ImagePlaceholder(
                    height: 20,
                    width: 20,
                    imagePath: 'assets/images/solana_logo.png',
                    placeholder: Container(
                      height: 20,
                      width: 20,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  solPrice == '?'
                      ? solPrice
                      : '\$${double.parse(solPrice).toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily:
                        Theme.of(context).textTheme.bodyText1?.fontFamily,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const SizedBox(
                    height: 25,
                    width: 25,
                    child: Icon(
                      Icons.refresh,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
