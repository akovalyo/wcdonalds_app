import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/worker_nft.dart';
import '../navigation/routes.dart';
import '../pages/headers/hero_header.dart';
import '../models/web_view_extra_wrapper.dart';
import '../models/url_launcher.dart';
import '../models/request.dart';

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
                  child: buildWorkerTile(
                    () async {
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
                    const Color(0xFFF48FB1),
                    workerOneImage,
                    const Key('workerImageOne'),
                  )),
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
                  child: buildWorkerTile(
                    () async {
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
                    const Color(0xfff6d61c),
                    workerTwoImage,
                    const Key('workerImageTwo'),
                  )),
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
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: buildSocialLogoTile(() {
                  UrlLauncher.openInBrowser('https://discord.gg/cWHBN4XJNj');
                }, const Color(0xff3f53b4), 'assets/images/discord_logo.png'),
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
                child: buildSocialLogoTile(() {
                  UrlLauncher.openInBrowser(
                      'https://www.instagram.com/wcdonaldsnft/');
                }, const Color(0xFFBB31D3), 'assets/images/instagram_logo.png'),
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
                child: buildSocialLogoTile(() {
                  UrlLauncher.openInBrowser('https://twitter.com/WcdonaldsNFT');
                }, const Color(0xff56bbd0), 'assets/images/twitter_logo.png'),
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
        image: 'assets/images/chart.png',
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

  Widget buildWorkerTile(
      VoidCallback onTap, Color color, String image, Key key) {
    return InkWell(
      key: key,
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
      key: const Key('franchiseWidget'),
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
    final WebViewExtraWrapper extra = WebViewExtraWrapper(
        title: 'wcdonalds.io',
        webView: const WebView(
          initialUrl: 'https://wcdonalds.io',
          javascriptMode: JavascriptMode.unrestricted,
        ));
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: InkWell(
        onTap: () {
          context.push(Routes.webView.path, extra: extra);
        },
        child: const Center(
          child: Text('wcdonalds.io',
              style: TextStyle(
                color: Colors.black,
              )),
        ),
      ),
    );
  }

  Widget buildSocialLogoTile(VoidCallback onTap, Color color, String image) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        color: color,
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
