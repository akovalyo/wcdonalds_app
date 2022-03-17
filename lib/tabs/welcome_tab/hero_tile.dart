import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages/headers/hero_header.dart';

class HeroTile extends StatelessWidget {
  final String tag;
  final String title;
  final String image;
  final Color color;
  final String link;

  const HeroTile({
    Key? key,
    required this.tag,
    required this.title,
    required this.image,
    required this.color,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: HeroHeader(
        tag: tag,
        title: title,
        image: image,
        color: color,
        onTap: () {
          context.push(link);
        },
      ),
    );
  }
}
