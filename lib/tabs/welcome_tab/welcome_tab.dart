import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../navigation/routes.dart';
import '../../models/worker_nft.dart';
import '../../models/web_view_extra_wrapper.dart';
import '../../models/url_launcher.dart';
import '../../models/request.dart';
import '../../widgets/hyperlink.dart';
import 'tiles.dart';
import '../../models/collection_stat.dart';

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
      final metadata =
          await Request.get('${Request.nftWorkerUrl}$randomId.json');
      final WorkerNft worker = WorkerNft.fromJson(metadata, randomId);
      return worker.imageUrl;
    });
  }

  void loadRandomImage(BuildContext context) async {
    try {
      final newUrl = await randomImage();
      if (newUrl.isNotEmpty) {
        setState(() {
          workerOneImage = newUrl;
        });
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Faild to load image'),
          backgroundColor: Theme.of(context).errorColor.withOpacity(0.7),
        ),
      );
    }
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
                child: Container(
                  color: const Color(0xFF303030),
                  child: const Image(
                    image: AssetImage('assets/images/welcome.png'),
                    width: 50,
                  ),
                ),
              ),
              StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: WorkerTile(
                    onTap: () async {
                      try {
                        final newUrl = await randomImage();
                        if (newUrl.isNotEmpty) {
                          setState(() {
                            workerOneImage = newUrl;
                          });
                        } else {
                          throw Exception('Failed to load image');
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Faild to load image'),
                            backgroundColor:
                                Theme.of(context).errorColor.withOpacity(0.7),
                          ),
                        );
                      }
                    },
                    color: const Color(0xFFF48FB1),
                    image: workerOneImage,
                    keyWidget: const Key('workerImageOne'),
                  )),
              StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 2,
                child: HeroTile(
                  tag: 'tokenomics',
                  title: 'TOKENOMICS',
                  image: 'assets/images/chart.png',
                  color: const Color(0xFFFF8A65),
                  link: Routes.tokenomics.path,
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 3,
                child: HeroTile(
                  tag: 'faq',
                  title: 'FAQ',
                  image: 'assets/images/faq.png',
                  color: const Color(0xFF64B5F6),
                  link: Routes.faq.path,
                ),
              ),
              StaggeredGridTile.count(
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 3,
                  child: WorkerTile(
                    onTap: () async {
                      try {
                        final newUrl = await randomImage();
                        if (newUrl.isNotEmpty) {
                          setState(() {
                            workerTwoImage = newUrl;
                          });
                        } else {
                          throw Exception('Failed to load image');
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Faild to load image'),
                            backgroundColor:
                                Theme.of(context).errorColor.withOpacity(0.7),
                          ),
                        );
                      }
                    },
                    color: const Color(0xfff6d61c),
                    image: workerTwoImage,
                    keyWidget: const Key('workerImageTwo'),
                  )),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: FranchiseTile(
                  franchiseIndex: franchiseIndex,
                  onTap: () {
                    setState(() {
                      franchiseIndex = franchiseIndex == 0 ? 1 : 0;
                    });
                  },
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 1,
                child: Container(
                  color: Theme.of(context).colorScheme.primary,
                  child: Container(
                    color: Theme.of(context).colorScheme.primary,
                    child: Center(
                      child: Hyperlink(
                        title: 'wcdonalds.io',
                        color: Colors.black,
                        underline: false,
                        onTap: () {
                          context.push(
                            Routes.webView.path,
                            extra: WebViewExtraWrapper(
                                title: 'wcdonalds.io',
                                webView: const WebView(
                                  initialUrl: 'https://wcdonalds.io',
                                  javascriptMode: JavascriptMode.unrestricted,
                                )),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [
                        0.3,
                        0.4,
                        0.9,
                      ],
                      colors: [
                        Color(0xFF00FFA3),
                        Color(0xFF03E1FF),
                        Color(0xFFDC1FFF),
                      ],
                    ),
                  ),
                  child: const SolPriceTile(),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 1,
                child: Container(
                  color: Colors.pink[400],
                  child: CollectionsStatTile(
                    title: 'WORKERS',
                    collectionStat: CollectionStat(
                      symbol: CollectionStat.workerSymbol,
                      imagePath: 'assets/images/worker_wback.png',
                    ),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 1,
                child: Container(
                  color: Colors.limeAccent[400],
                  child: CollectionsStatTile(
                    title: 'WANAGERS',
                    collectionStat: CollectionStat(
                        symbol: CollectionStat.wanagerSymbol,
                        imagePath: 'assets/images/wanager.png'),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: SocialLogoTile(
                    onTap: () {
                      UrlLauncher.openInBrowser(
                          'https://discord.gg/cWHBN4XJNj');
                    },
                    color: const Color(0xff3f53b4),
                    image: 'assets/images/discord_logo.png'),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Container(
                  color: Colors.green[400],
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: SocialLogoTile(
                    onTap: () {
                      UrlLauncher.openInBrowser(
                          'https://www.instagram.com/wcdonaldsnft/');
                    },
                    color: const Color(0xFFBB31D3),
                    image: 'assets/images/instagram_logo.png'),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Container(
                  color: Colors.yellow[400],
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: SocialLogoTile(
                    onTap: () {
                      UrlLauncher.openInBrowser(
                          'https://twitter.com/WcdonaldsNFT');
                    },
                    color: const Color(0xff56bbd0),
                    image: 'assets/images/twitter_logo.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
