import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/material.dart';

class WorkerNft {
  final String id;
  final String imageUrl;
  final String rarityRank;
  final String rarityTier;
  final Color rarityColor;
  final String wage;

  WorkerNft({
    required this.id,
    required this.imageUrl,
    required this.rarityRank,
    required this.rarityTier,
    required this.rarityColor,
    required this.wage,
  });

  factory WorkerNft.fromJson(Map<dynamic, dynamic> json, String id) {
    final List<dynamic> attr = (json['attributes'] as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .toList();
    // final String attrBackground = attr[0]['value'] as String;
    // final String attrClothing = attr[1]['value'] as String;
    // final String attrFace = attr[2]['value'] as String;
    // final String attrHeadgear = attr[3]['value'] as String;

    // Define rarityRank
    final int rarityInt = attr.last['value'] as int;

    //Define rarityTier and rarityColor
    String rarityTier = '';
    Color rarityColor = Colors.white;

    if (rarityInt <= 22) {
      rarityTier = 'MYTHIC';
      rarityColor = Colors.red[400] as Color;
    } else if (rarityInt <= 111) {
      rarityTier = 'LEGENDARY';
      rarityColor = Colors.amber[400] as Color;
    } else if (rarityInt <= 333) {
      rarityTier = 'EPIC';
      rarityColor = Colors.deepPurple[400] as Color;
    } else if (rarityInt <= 777) {
      rarityTier = 'RARE';
      rarityColor = Colors.blue[300] as Color;
    } else if (rarityInt <= 1333) {
      rarityTier = 'UNCOMMON';
      rarityColor = Colors.green[300] as Color;
    } else {
      rarityTier = 'COMMON';
      rarityColor = Colors.grey[400] as Color;
    }

    // Define worker's wage
    String wage;
    if (rarityInt <= 10) {
      wage = '155';
    } else if (rarityInt <= 99) {
      wage = '148';
    } else if (rarityInt <= 499) {
      wage = '134';
    } else if (rarityInt <= 998) {
      wage = '124';
    } else if (rarityInt <= 1498) {
      wage = '115';
    } else if (rarityInt <= 1998) {
      wage = '100';
    } else {
      wage = '95';
    }

    return WorkerNft(
      id: id,
      imageUrl: json['image'] as String,
      rarityRank: rarityInt.toString(),
      wage: wage,
      rarityTier: rarityTier,
      rarityColor: rarityColor,
    );
  }
}
