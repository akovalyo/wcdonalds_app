import 'package:flutter/material.dart';

class SocialLogoTile extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  final String image;
  const SocialLogoTile({
    Key? key,
    required this.color,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
