import 'package:flutter/material.dart';

import '../../models/request.dart';
import '../../widgets/image_placeholder.dart';
import '../../models/collection_stat.dart';

class CollectionsStatTile extends StatefulWidget {
  final CollectionStat collectionStat;
  final String title;
  const CollectionsStatTile({
    Key? key,
    required this.collectionStat,
    required this.title,
  }) : super(key: key);

  @override
  State<CollectionsStatTile> createState() => _CollectionsStatTileState();
}

class _CollectionsStatTileState extends State<CollectionsStatTile> {
  // CollectionStat workers = CollectionStat(symbol: CollectionStat.workerSymbol);
  // CollectionStat wanagers =
  //     CollectionStat(symbol: CollectionStat.wanagerSymbol);

  @override
  void initState() {
    getFloorPrice(widget.collectionStat.symbol);
    super.initState();
  }

  void getFloorPrice(String symbol) async {
    try {
      final response = await Request.get(
          'https://api-mainnet.magiceden.dev/v2/collections/$symbol/stats');
      setState(() {
        widget.collectionStat
            .update(response['floorPrice'], response['listedCount']);
      });
    } catch (e) {
      setState(() {
        widget.collectionStat.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.black,
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
                      imagePath: widget.collectionStat.imagePath,
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
                    widget.collectionStat.floorPrice == 0
                        ? 'FP: ?'
                        : 'FP: ${(widget.collectionStat.floorPrice.toDouble() / 1000000000).toStringAsFixed(2)} Sol',
                    style: textStyle,
                  ),
                  Text(
                    widget.collectionStat.totalListed == 0
                        ? 'Listed: ?'
                        : 'Listed: ${widget.collectionStat.totalListed.toString()}',
                    style: textStyle,
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                height: 25,
                width: 25,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      widget.collectionStat.clear();
                    });

                    getFloorPrice(widget.collectionStat.symbol);
                  },
                  child: const Icon(
                    Icons.refresh,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
