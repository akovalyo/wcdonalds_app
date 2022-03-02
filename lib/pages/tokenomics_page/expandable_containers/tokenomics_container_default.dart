import 'package:flutter/material.dart';

import '../../../widgets/image_placeholder.dart';
import '../../../theme/theme.dart';

class TokenomicsContainerDefault extends StatelessWidget {
  final String? title;
  final String imagePath;
  final Widget body;
  const TokenomicsContainerDefault({
    Key? key,
    this.title,
    required this.imagePath,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: AppTheme.paddingHorizontal),
      child: Column(
        children: [
          title != null
              ? Text(
                  title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )
              : Container(),
          ImagePlaceholder(
            // height: 100,
            width: 100,
            imagePath: imagePath,
            placeholder: Container(
              color: Colors.transparent,
            ),
          ),
          const SizedBox(height: 12),
          body,
        ],
      ),
    );
  }
}
