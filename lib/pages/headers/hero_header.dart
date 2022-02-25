import 'package:flutter/material.dart';

class HeroHeader extends StatelessWidget {
  final String tag;
  final VoidCallback onTap;
  final Color color;
  final String title;
  final String image;
  final bool showBackButton;
  const HeroHeader({
    Key? key,
    required this.tag,
    required this.onTap,
    required this.color,
    required this.title,
    required this.image,
    this.showBackButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 160,
            color: color,
            child: Stack(
              alignment: Alignment.center,
              children: [
                showBackButton
                    ? Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: onTap,
                        ),
                      )
                    : Container(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        )),
                    const SizedBox(height: 10),
                    Image(
                      image: AssetImage(image),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
