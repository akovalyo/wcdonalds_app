import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class WorkerNft {
  final String id;
  final String imageUrl;
  final String rarity;

  WorkerNft({
    required this.id,
    required this.imageUrl,
    required this.rarity,
  });

  static Future<Map<String, dynamic>> queryNftData(String id) {
    return Future(
      () async {
        final url = Uri.parse(
            'https://testlaunchmynft.mypinata.cloud/ipfs/QmbVfkviPGQYwsxzWimUW8t3WMm8Zk58Fx6HZKA2YWzPHL/$id.json');
        final response = await http.get(url);

        if (response.statusCode == 200) {
          final jsonResponse =
              convert.jsonDecode(response.body) as Map<String, dynamic>;
          return jsonResponse;
        }
        return Future.error('Failed to get response');
      },
    );
  }

  factory WorkerNft.fromJson(Map<dynamic, dynamic> json, String id) {
    final List<dynamic> attr = (json['attributes'] as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .toList();
    // final String attrBackground = attr[0]['value'] as String;
    // final String attrClothing = attr[1]['value'] as String;
    // final String attrFace = attr[2]['value'] as String;
    // final String attrHeadgear = attr[3]['value'] as String;
    final int attrRarity = attr.last['value'] as int;

    return WorkerNft(
      id: id,
      imageUrl: json['image'] as String,
      rarity: attrRarity.toString(),
    );
  }

  String getWorkersSalary() {
    int rarityInt = int.parse(rarity);

    if (rarityInt <= 10) {
      return '155';
    } else if (rarityInt <= 99) {
      return '148';
    } else if (rarityInt <= 499) {
      return '134';
    } else if (rarityInt <= 998) {
      return '124';
    } else if (rarityInt <= 1498) {
      return '115';
    } else if (rarityInt <= 1998) {
      return '100';
    } else if (rarityInt <= 2222) {
      return '95';
    }

    return '0';
  }
}
