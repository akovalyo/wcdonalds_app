import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';

import '../models/worker_nft.dart';

class WelcomeTab extends StatefulWidget {
  const WelcomeTab({Key? key}) : super(key: key);

  @override
  State<WelcomeTab> createState() => _WelcomeTabState();
}

class _WelcomeTabState extends State<WelcomeTab> {
  final List<Widget> list = [
    const Image(
      image: AssetImage('assets/images/welcome.png'),
      width: 50,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue[300],
    ),
    Container(
      color: Colors.deepOrange[300],
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

  // void replaceImage() async {
  //   final newUrl = await randomImage()
  // }

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
              //Welcome
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

              //Green
              StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 2,
                child: list[1],
              ),
              //Blue
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 3,
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
              //Orange
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: list[3],
              ),
            ],
          ),
        ],
      ),
    );
    // double width = MediaQuery.of(context).size.width;
    // final double padding = 15.0;
    // final Size screenSize = MediaQuery.of(context).size;
    // final double availableHeight = screenSize.height -
    //     wcBarHeight -
    //     MediaQuery.of(context).padding.top -
    //     MediaQuery.of(context).padding.bottom -
    //     padding * 10;
    // final double availableWidth = screenSize.width - padding * 2;
    // return Align(
    //   alignment: Alignment.center,
    //   child: Container(
    //     padding: EdgeInsets.all(padding),
    //     height: availableHeight,
    //     width: availableWidth,
    //     color: Colors.blue,
    //   ),
    // );

    // ListView(
    //   padding: const EdgeInsets.only(top: 20),
    //   children: [
    //     StaggeredGrid.count(
    //       crossAxisCount: 4,
    //       mainAxisSpacing: 6,
    //       crossAxisSpacing: 6,
    //       children: [
    //         StaggeredGridTile.count(
    //           crossAxisCellCount: 2,
    //           mainAxisCellCount: 2,
    //           child: Container(
    //             color: Colors.yellow,
    //           ),
    //         ),
    //         StaggeredGridTile.count(
    //           crossAxisCellCount: 2,
    //           mainAxisCellCount: 1,
    //           child: Container(
    //             color: Colors.red,
    //           ),
    //         ),
    //         StaggeredGridTile.count(
    //           crossAxisCellCount: 1,
    //           mainAxisCellCount: 1,
    //           child: Container(
    //             color: Colors.green,
    //           ),
    //         ),
    //         StaggeredGridTile.count(
    //           crossAxisCellCount: 1,
    //           mainAxisCellCount: 1,
    //           child: Container(
    //             color: Colors.blue,
    //           ),
    //         ),
    //         StaggeredGridTile.count(
    //           crossAxisCellCount: 4,
    //           mainAxisCellCount: 2,
    //           child: Container(
    //             color: Colors.red,
    //           ),
    //         ),
    //       ],
    //     ),

    // Align(
    //   alignment: Alignment.center,
    //   child: Image(
    //     image: const AssetImage('assets/images/logo_y.png'),
    //     width: 0.2 * width,
    //   ),
    // ),
    // const SizedBox(
    //   height: 20,
    // ),
    // Center(
    //     child: Text(
    //   'Welcome to Wcdonalds!',
    //   style: Theme.of(context).textTheme.headline3,
    // ),),
    // ],
    // );
  }
}
