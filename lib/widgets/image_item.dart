import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageItem extends StatelessWidget {
  final String imageUrl;

  const ImageItem({super.key, required this.imageUrl});

  static const double size = 80;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,

          placeholder:
              (context, url) => Container(
                color: Colors.grey[300],
                alignment: Alignment.center,
                child: const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),

          errorWidget:
              (context, url, error) => const Icon(
                Icons.image_not_supported_outlined,
                size: 40,
                color: Colors.grey,
              ),
        ),
      ),
    );
  }
}
