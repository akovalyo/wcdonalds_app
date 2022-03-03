import 'package:flutter/material.dart';

import '../models/worker_nft.dart';
import '../widgets/image_placeholder.dart';
import '../theme/theme.dart';

class WorkersTabWorkerTile extends StatelessWidget {
  final WorkerNft nft;

  const WorkersTabWorkerTile({
    Key? key,
    required this.nft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Wcdonalds Worker #${nft.id}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: ImagePlaceholder(
                height: 200,
                width: 200,
                imagePath: nft.imageUrl,
                placeholder: Container(
                  height: 200,
                  width: 200,
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 5,
              spacing: 10,
              direction: Axis.horizontal,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '• Rank: ',
                        style: AppTheme.richTextBody1Black(context,
                            themeColor: true, bold: true),
                      ),
                      TextSpan(
                        text: nft.rarityRank,
                        style: AppTheme.richTextBody1Black(context,
                            themeColor: true),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 70,
                  decoration: BoxDecoration(
                      color: nft.rarityColor,
                      border: Border.all(color: Colors.black),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(1, 2),
                        ),
                      ],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                  child: Text(
                    nft.rarityTier,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyText1?.fontFamily,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '• Wage: ',
                  style: AppTheme.richTextBody1Black(
                    context,
                    themeColor: true,
                    bold: true,
                  ),
                ),
                TextSpan(
                  text: '${nft.wage} \$Wc per day',
                  style: AppTheme.richTextBody1Black(context, themeColor: true),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
