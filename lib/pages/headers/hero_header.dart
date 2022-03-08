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
                if (showBackButton)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      onPressed: onTap,
                    ),
                  ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,
                        style: TextStyle(
                          fontFamily:
                              Theme.of(context).textTheme.headline4?.fontFamily,
                          fontSize:
                              Theme.of(context).textTheme.headline4?.fontSize,
                          color: Colors.black,
                        )),
                    const SizedBox(height: 10),
                    Image(
                      width: 70,
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
