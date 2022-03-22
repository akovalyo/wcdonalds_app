import 'package:flutter/services.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Request {
  static String nftWorkerUrl =
      'https://testlaunchmynft.mypinata.cloud/ipfs/QmbVfkviPGQYwsxzWimUW8t3WMm8Zk58Fx6HZKA2YWzPHL/';

  static Future<Map<String, dynamic>> local(String pathToFile) async {
    // await Future.delayed(const Duration(milliseconds: 2000));

    try {
      final String response = await rootBundle.loadString(pathToFile);
      final jsn = await convert.jsonDecode(response);
      return jsn;
    } catch (e) {
      return Future.error('Something went wrong');
    }
  }

  static Future<Map<String, dynamic>> get(String url) async {
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      final jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else if (response.statusCode == 418 || response.statusCode == 429) {
      return Future.error(
          'Please limit request rate or your IP will be banned');
    }
    return Future.error('Failed to get response');
  }
}
