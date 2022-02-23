import 'package:flutter/services.dart';
import 'dart:convert';

class Rarity {
  Map<String, dynamic> db;
  Rarity({this.db = const {}});

  void load() async {
    final String response =
        await rootBundle.loadString('assets/data/rarity.json');
    db = await json.decode(response);
  }
}
