import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../models/worker_nft.dart';
import '../navigation/routes.dart';
import '../pages/headers/hero_header.dart';

class WelcomeTab extends StatefulWidget {
  const WelcomeTab({Key? key}) : super(key: key);

  @override
  State<WelcomeTab> createState() => _WelcomeTabState();
}

class _WelcomeTabState extends State<WelcomeTab> {
  String workerOneImage =
      'https://testlaunchmynft.mypinata.cloud/ipfs/QmT5mjn82ivmNzykGcyQMmWhudUpvQwGhTQwSRozEj5Tbh/70.png';
  String workerTwoImage =
      'https://testlaunchmynft.mypinata.cloud/ipfs/QmT5mjn82ivmNzykGcyQMmWhudUpvQwGhTQwSRozEj5Tbh/1525.png';

  int franchiseIndex = 0;

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
              StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 1,
                child: buildWelcomeTile(),
              ),
              StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: buildWorkerTile(() async {
                    final newUrl = await randomImage();
                    setState(() {
                      workerOneImage = newUrl;
                    });
                  }, const Color(0xFFF48FB1), workerOneImage)),
              StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 2,
                child: buildTokenomicsTile(context),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 3,
                child: buildFaqTile(),
              ),
              StaggeredGridTile.count(
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 3,
                  child: buildWorkerTile(() async {
                    final newUrl = await randomImage();
                    setState(() {
                      workerTwoImage = newUrl;
                    });
                  }, const Color(0xfff6d61c), workerTwoImage)),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: buildFranchiseTile(),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 1,
                child: buildWebsiteTile(context),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Container(
                  color: Colors.green[400],
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Container(
                  color: Colors.yellow[400],
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Container(
                  color: Colors.blue[400],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildFaqTile() {
    return SizedBox(
      child: HeroHeader(
        tag: 'faq',
        title: 'FAQ',
        image: 'assets/images/faq.png',
        color: const Color(0xFF64B5F6),
        onTap: () {
          // context.push(Routes.faq.path);
          context.go(Routes.faq.path);
        },
      ),
    );
  }

  Widget buildTokenomicsTile(BuildContext context) {
    return SizedBox(
      child: HeroHeader(
        tag: 'tokenomics',
        title: 'TOKENOMICS',
        image: 'assets/images/wcdollar.png',
        color: const Color(0xFFFF8A65),
        onTap: () {
          context.push(Routes.tokenomics.path);
          // context.go(Routes.tokenomics.path);
        },
      ),
    );
  }

  Widget buildWelcomeTile() {
    return Container(
      color: const Color(0xFF303030),
      child: const Image(
        image: AssetImage('assets/images/welcome.png'),
        width: 50,
      ),
    );
  }

  Widget buildWorkerTile(VoidCallback onTap, Color color, image) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: color,
        child: FadeInImage.memoryNetwork(
            fit: BoxFit.fill, placeholder: kTransparentImage, image: image),
      ),
    );
  }

  Widget buildFranchiseTile() {
    return InkWell(
      onTap: () {
        setState(() {
          franchiseIndex = franchiseIndex == 0 ? 1 : 0;
        });
      },
      child: Container(
        color: const Color(0xFFBA68C8),
        child: AnimatedCrossFade(
          crossFadeState: franchiseIndex == 0
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 500),
          firstChild: const Image(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/franchise_1.jpeg'),
          ),
          secondChild: const Image(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/franchise_2.jpeg'),
          ),
        ),
      ),
    );
  }

  Widget buildWebsiteTile(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Center(
        child: Text('wcdonalds.io',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            )),
      ),
    );
  }
}
