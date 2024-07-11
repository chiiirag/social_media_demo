import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({
    super.key,
    required this.imagePath,
    this.fit,
    this.height,
    this.width,
  });

  final String imagePath;
  final BoxFit? fit;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(imagePath),
      fit: fit,
      height: height,
      width: width,
    );
  }
}
