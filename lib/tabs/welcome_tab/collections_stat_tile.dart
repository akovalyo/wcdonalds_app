import 'package:flutter/material.dart';
import 'package:wcdonalds_app/models/url_launcher.dart';

import '../../models/request.dart';
import '../../widgets/image_placeholder.dart';
import '../../models/collection_stat.dart';

class CollectionsStatTile extends StatefulWidget {
  final String title;
  const CollectionsStatTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<CollectionsStatTile> createState() => _CollectionsStatTileState();
}

class _CollectionsStatTileState extends State<CollectionsStatTile> {
  late CollectionStat collectionStat;

  @override
  void initState() {
    if (widget.title == 'WORKERS') {
      collectionStat = CollectionStat(
        symbol: CollectionStat.workerSymbol,
        imagePath: 'assets/images/worker_wback.png',
      );
    } else {
      collectionStat = CollectionStat(
          symbol: CollectionStat.wanagerSymbol,
          imagePath: 'assets/images/wanager.png');
    }
    getFloorPrice(collectionStat.symbol);
    super.initState();
  }

  void getFloorPrice(String symbol) async {
    try {
      final response = await Request.get(
          'https://api-mainnet.magiceden.dev/v2/collections/$symbol/stats');
      setState(() {
        collectionStat.update(response['floorPrice'], response['listedCount']);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Collection ${widget.title.toLowerCase()}: ${e.toString()}'),
          backgroundColor: Theme.of(context).errorColor.withOpacity(0.7),
        ),
      );
      setState(() {
        collectionStat.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontFamily: Theme.of(context).textTheme.bodyText1?.fontFamily,
    );
    final titleStyle = TextStyle(
      color: Colors.black,
      fontFamily: Theme.of(context).textTheme.bodyText1?.fontFamily,
      fontSize: 12,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: ImagePlaceholder(
                      height: 30,
                      width: 30,
                      imagePath: collectionStat.imagePath,
                      placeholder: Container(
                        height: 30,
                        width: 30,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  Text(
                    widget.title,
                    style: titleStyle,
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    collectionStat.floorPrice == 0
                        ? 'FP: ?'
                        : 'FP: ${(collectionStat.floorPrice.toDouble() / 1000000000).toStringAsFixed(2)} Sol',
                    style: textStyle,
                  ),
                  Text(
                    collectionStat.totalListed == 0
                        ? 'Listed: ?'
                        : 'Listed: ${collectionStat.totalListed.toString()}',
                    style: textStyle,
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          collectionStat.clear();
                        });

                        getFloorPrice(collectionStat.symbol);
                      },
                      child: const Icon(
                        Icons.refresh,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // const SizedBox(width: 5),
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: InkWell(
                      onTap: () {
                        UrlLauncher.openInBrowser(
                            'https://magiceden.io/marketplace/${collectionStat.symbol}');
                      },
                      child: ImagePlaceholder(
                        height: 25,
                        width: 25,
                        imagePath: 'assets/images/me.png',
                        placeholder: Container(
                          height: 25,
                          width: 25,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
