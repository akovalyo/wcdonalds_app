import 'dart:math';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../models/worker_nft.dart';

class WelcomeTab extends StatefulWidget {
  const WelcomeTab({Key? key}) : super(key: key);

  @override
  State<WelcomeTab> createState() => _WelcomeTabState();
}

class _WelcomeTabState extends State<WelcomeTab> {
  final List<Widget> list = [
    Container(
      color: const Color(0xFF303030),
      child: const Image(
        image: AssetImage('assets/images/welcome.png'),
        width: 50,
      ),
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue[300],
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('FAQ',
              style: TextStyle(
                color: Color(0xfff6d61c),
              )),
          SizedBox(height: 10),
          Image(
            image: AssetImage('assets/images/faq.png'),
          ),
        ],
      )),
    ),
    Container(
      color: Colors.deepOrange[300],
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('TOKENOMICS',
              style: TextStyle(
                color: Color(0xfff6d61c),
              )),
          SizedBox(height: 10),
          Image(
            image: AssetImage('assets/images/wcdollar.png'),
          ),
        ],
      )),
    ),
  ];

  String nftImageOne =
      'https://testlaunchmynft.mypinata.cloud/ipfs/QmT5mjn82ivmNzykGcyQMmWhudUpvQwGhTQwSRozEj5Tbh/70.png';
  String nftImageTwo =
      'https://testlaunchmynft.mypinata.cloud/ipfs/QmT5mjn82ivmNzykGcyQMmWhudUpvQwGhTQwSRozEj5Tbh/1525.png';

  Future<String> randomImage() {
    return Future(() async {
      final Random random = Random();
      final String randomId = random.nextInt(2222).toString();
      final metadata = await WorkerNft.queryNftData(randomId);
      final WorkerNft worker = WorkerNft.fromJson(metadata, randomId);
      return worker.imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          StaggeredGrid.count(
            crossAxisCount: 5,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: [
              // Welcome
              StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 1,
                child: list[0],
              ),

              //Worker1
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: InkWell(
                  onTap: () async {
                    final newUrl = await randomImage();
                    setState(() {
                      nftImageOne = newUrl;
                    });
                  },
                  child: Container(
                    color: Colors.pink[200],
                    child: FadeInImage.memoryNetwork(
                        fit: BoxFit.fill,
                        placeholder: kTransparentImage,
                        image: nftImageOne),
                  ),
                ),
              ),

              //Orange
              StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 2,
                child: list[3],
              ),
              //Blue
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 4,
                child: list[2],
              ),

              //Worker2
              StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 3,
                child: InkWell(
                  onTap: () async {
                    final newUrl = await randomImage();
                    setState(() {
                      nftImageTwo = newUrl;
                    });
                  },
                  child: Container(
                    color: const Color(0xfff6d61c),
                    child: FadeInImage.memoryNetwork(
                        fit: BoxFit.fill,
                        placeholder: kTransparentImage,
                        image: nftImageTwo),
                  ),
                ),
              ),
              // //Green
              // StaggeredGridTile.count(
              //   crossAxisCellCount: 2,
              //   mainAxisCellCount: 1,
              //   child: list[1],
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
