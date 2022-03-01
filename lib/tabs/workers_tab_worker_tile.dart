import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/worker_nft.dart';

class WorkersTabWorkerTile extends StatelessWidget {
  final WorkerNft nft;

  const WorkersTabWorkerTile({
    Key? key,
    required this.nft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text('Wcdonalds Worker #${nft.id}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage, image: nft.imageUrl),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(child: Text('Rank: ${nft.rarity}')),
      ],
    );
  }
}
