import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../navigation/routes.dart';
import '../../models/web_view_extra_wrapper.dart';
import '../../models/url_launcher.dart';
import '../../widgets/hyperlink.dart';
import 'tiles.dart';

class WelcomeTab extends StatefulWidget {
  const WelcomeTab({Key? key}) : super(key: key);

  @override
  State<WelcomeTab> createState() => _WelcomeTabState();
}

class _WelcomeTabState extends State<WelcomeTab> {
  int franchiseIndex = 0;

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
              const StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: WorkerTile(
                    defaultImage:
                        'https://testlaunchmynft.mypinata.cloud/ipfs/QmT5mjn82ivmNzykGcyQMmWhudUpvQwGhTQwSRozEj5Tbh/70.png',
                    color: Color(0xFFF48FB1),
                    keyWidget: Key('workerImageOne'),
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
              const StaggeredGridTile.count(
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 3,
                  child: WorkerTile(
                    color: Color(0xfff6d61c),
                    defaultImage:
                        'https://testlaunchmynft.mypinata.cloud/ipfs/QmT5mjn82ivmNzykGcyQMmWhudUpvQwGhTQwSRozEj5Tbh/1525.png',
                    keyWidget: Key('workerImageTwo'),
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
                  child: const CollectionsStatTile(
                    title: 'WORKERS',
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 1,
                child: Container(
                  color: Colors.limeAccent[400],
                  child: const CollectionsStatTile(
                    title: 'WANAGERS',
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
