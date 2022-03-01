import 'package:flutter/material.dart';

import '../widgets/app_circular_progress_indicator.dart';

class ImagePlaceholder extends StatelessWidget {
  final String imagePath;
  final Widget placeholder;
  final Widget? child;
  final Duration duration;
  final double? width;
  final double? height;
  final BoxFit? fit;

  final bool loadingIndicator;

  const ImagePlaceholder({
    Key? key,
    this.imagePath = '',
    required this.placeholder,
    this.child,
    this.duration = const Duration(milliseconds: 500),
    this.width,
    this.loadingIndicator = false,
    this.height,
    this.fit = BoxFit.fill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageProvider = imagePath.startsWith('http')
        ? NetworkImage(imagePath)
        : AssetImage(imagePath) as ImageProvider;

    return Image(
      image: imageProvider,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: loadingIndicator
          ? (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              double? totalBytes =
                  loadingProgress.expectedTotalBytes as double?;
              double bytesLoaded =
                  loadingProgress.cumulativeBytesLoaded as double;

              return Container(
                width: width,
                height: height,
                color: Theme.of(context).primaryColorDark,
                child: Center(
                  child: AppCircularProgressIndicator(
                    value: totalBytes != null && totalBytes != 0
                        ? bytesLoaded / totalBytes
                        : null,
                  ),
                ),
              );
            }
          : null,
      frameBuilder: (context, child, frame, wasSyncLoaded) {
        if (wasSyncLoaded) {
          return this.child ?? child;
        } else {
          return AnimatedSwitcher(
            duration: duration,
            child: frame != null ? this.child ?? child : placeholder,
          );
        }
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: width,
          width: width,
          color: Theme.of(context).primaryColorDark,
          child: const Center(
            child: Icon(Icons.error_outline_outlined),
          ),
        );
      },
    );
  }
}
