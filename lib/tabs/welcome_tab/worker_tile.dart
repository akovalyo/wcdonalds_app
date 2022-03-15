import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class WorkerTile extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  final String image;
  final Key keyWidget;
  const WorkerTile({
    Key? key,
    required this.onTap,
    required this.color,
    required this.image,
    required this.keyWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
