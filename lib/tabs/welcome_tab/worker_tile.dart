import 'dart:math';
import 'package:flutter/material.dart';
import 'package:wcdonalds_app/widgets/image_placeholder.dart';
import '../../models/request.dart';
import '../../models/worker_nft.dart';

class WorkerTile extends StatefulWidget {
  final Color color;

  final Key keyWidget;
  final String defaultImage;
  const WorkerTile(
      {Key? key,
      required this.color,
      required this.keyWidget,
      required this.defaultImage})
      : super(key: key);

  @override
  State<WorkerTile> createState() => _WorkerTileState();
}

class _WorkerTileState extends State<WorkerTile> {
  late String workerImage;

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
          workerImage = newUrl;
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
  void initState() {
    workerImage = widget.defaultImage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: widget.key,
      onTap: () {
        loadRandomImage(context);
      },
      child: Container(
        color: widget.color,
        child: ImagePlaceholder(
            placeholder: Container(), fit: BoxFit.fill, imagePath: workerImage),
      ),
    );
  }
}
