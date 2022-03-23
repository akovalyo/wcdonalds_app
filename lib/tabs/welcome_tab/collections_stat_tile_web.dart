import 'package:flutter/material.dart';

import '../../models/url_launcher.dart';
import '../../widgets/image_placeholder.dart';
import '../../models/collection_stat.dart';

//temporary while ME api is not working in the web app
class CollectionsStatTileWeb extends StatelessWidget {
  final String title;
  final CollectionStat collectionStat;

  const CollectionsStatTileWeb({
    Key? key,
    required this.title,
    required this.collectionStat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
      color: Colors.black,
      fontFamily: Theme.of(context).textTheme.bodyText1?.fontFamily,
      fontSize: 12,
    );
    final String meCollectionLink =
        'https://magiceden.io/marketplace/${collectionStat.symbol}';

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
                  InkWell(
                    onTap: () {
                      UrlLauncher.openInBrowser(meCollectionLink);
                    },
                    child: SizedBox(
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
                  ),
                  Text(
                    title,
                    style: titleStyle,
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 25,
                width: 25,
                child: InkWell(
                  onTap: () {
                    UrlLauncher.openInBrowser(meCollectionLink);
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
        ),
      ),
    );
  }
}
